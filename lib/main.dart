import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/screens/network_error.dart';
import 'package:zihnai/ultils/providers/chat_provider.dart';
import 'package:zihnai/ultils/providers/feed_provider.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';
import 'package:zihnai/screens/home.dart';
import 'package:zihnai/screens/onboarding/onboarding.dart';
import 'package:zihnai/ultils/services/notification_service.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: HexColor(dark),
    systemNavigationBarColor: HexColor(dark),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;

  NotificationService().initializeNotifications();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => ChatProvider()),
      ChangeNotifierProvider(create: (context) => FeedProvider()),
    ],
    child: Main(showHome: showHome),
  ));
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
        await Provider.of<FeedProvider>(context, listen: false)
            .updateFeedList();
      }
      if (mounted && networkIsConnected && widget.showHome) {
        await Provider.of<UserProvider>(context, listen: false)
            .initializeUserData();
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
        localeResolutionCallback:
            (Locale? locale, Iterable<Locale> supportedLocales) {
          if (locale != null) {
            print(
                "\x1B[31mAlgılanan cihaz dili: Dil Kodu: ${locale.languageCode}, Ülke Kodu: ${locale.countryCode}\x1B[0m");

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
          debugPrint(
              "\x1B[31mHATA: Cihaz dili desteklenmiyor, İngilizce seçildi.\x1B[0m");
          return Locale('en'); // İngilizce varsayılan olarak döndürülüyor
        },
        theme: ThemeData(
            scaffoldBackgroundColor: HexColor(dark),
            colorScheme: ColorScheme.fromSeed(
              seedColor: HexColor(primary),
            ),
            useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: !isConnected
            ? NetworkError()
            : !widget.showHome
                ? Onboarding()
                : Home());
  }
}
