import 'dart:io';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/screens/network_error.dart';
import 'package:zihnai/ultils/enums/subscription_status_enum.dart';
import 'package:zihnai/ultils/providers/chat_provider.dart';
import 'package:zihnai/ultils/providers/feed_provider.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';
import 'package:zihnai/screens/home.dart';
import 'package:zihnai/screens/onboarding/onboarding.dart';
import 'package:zihnai/ultils/services/api_services.dart';
import 'package:zihnai/ultils/services/notification_service.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:workmanager/workmanager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// Bu arka plan görevini çalıştıracak fonksiyon

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case "affirmationNotification":
        try {
          final prefs = await SharedPreferences.getInstance();
          List<String>? topicList = prefs.getStringList('topics');
          if (topicList == null) {
            await prefs.setStringList('topics', ["General"]);
            topicList = ["General"];
          }

          String response = await ApiService().generateMotivationNotification(
            topicList,
          );
          await NotificationService().showNotification('Zihn AI', response);
        } catch (e) {
          return Future.value(true);
        }

        break;

      case Workmanager.iOSBackgroundTask:
        try {
          final prefs = await SharedPreferences.getInstance();
          List<String>? topicList = prefs.getStringList('topics');
          if (topicList == null) {
            await prefs.setStringList('topics', ["General"]);
            topicList = ["General"];
          }

          String response = await ApiService().generateMotivationNotification(
            topicList,
          );
          await NotificationService().showNotification('Zihn AI', response);
        } catch (e) {
          return Future.value(true);
        }

        break;
      default:
    }
    return Future.value(true);
  });
}

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: HexColor(dark),
      systemNavigationBarColor: HexColor(dark),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  await Purchases.setLogLevel(LogLevel.debug);

  if (Platform.isIOS) {
    await Purchases.configure(
      PurchasesConfiguration("appl_wgxpzWOErULJIOrMnAiiwZjAEYg"),
    );
  } else {
    await Purchases.configure(
      PurchasesConfiguration("goog_CLiuYsgdymVOsnRsMEzzBMhNzIK"),
    );
  }

  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;

  NotificationService().initializeNotifications();

  Workmanager().initialize(callbackDispatcher);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.appAttest,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => FeedProvider()),
      ],
      child: Main(showHome: showHome),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({super.key, required this.showHome});
  final bool showHome;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      bool networkIsConnected = await checkConnectivity();
      if (mounted && networkIsConnected) {
        if (Provider.of<UserProvider>(
              context,
              listen: false,
            ).userSubscriptionStatus ==
            SubscriptionStatus.premium) {
          await Provider.of<FeedProvider>(
            context,
            listen: false,
          ).updatePremiumFeedList();
        } else {
          await Provider.of<FeedProvider>(
            context,
            listen: false,
          ).updateFeedList();
        }
      }
      if (mounted && networkIsConnected && widget.showHome) {
        await Provider.of<UserProvider>(
          context,
          listen: false,
        ).initializeUserData();
      }
    });
  }

  Future<bool> checkConnectivity() async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    bool networkIsConnected =
        !connectivityResult.contains(ConnectivityResult.none);
    setState(() {
      isConnected = networkIsConnected;
    });
    return networkIsConnected;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (
        Locale? locale,
        Iterable<Locale> supportedLocales,
      ) {
        if (locale != null) {
          // Cihaz dili desteklenenler arasında mı kontrol et
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                (supportedLocale.countryCode == locale.countryCode ||
                    supportedLocale.countryCode == null)) {
              return supportedLocale; // Cihaz dili destekleniyorsa, onu kullan
            }
          }
        }

        // Eğer cihaz dili desteklenmiyorsa İngilizceyi döndür

        return Locale('en'); // İngilizce varsayılan olarak döndürülüyor
      },
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor(dark),
        colorScheme: ColorScheme.fromSeed(seedColor: HexColor(primary)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:
          !isConnected
              ? NetworkError()
              : !widget.showHome
              ? Onboarding()
              : Home(),
    );
  }
}
