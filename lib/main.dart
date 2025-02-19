import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zihnai/screens/network_error.dart';
import 'package:zihnai/ultils/providers/chat_provider.dart';
import 'package:zihnai/ultils/providers/feed_provider.dart';
import 'package:zihnai/ultils/providers/user_provider.dart';
import 'package:zihnai/screens/home.dart';
import 'package:zihnai/screens/onboarding/onboarding.dart';
import 'package:zihnai/ultils/services/notification_service.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:connectivity_plus/connectivity_plus.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: HexColor(dark),
    systemNavigationBarColor: HexColor(dark),
  ));
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;
  tz.initializeTimeZones();
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
  List<ConnectivityResult> connectivityResult = [];

  @override
  void initState() {
    super.initState();
    checkConnectivity();
    Future.microtask(() async {
      if (mounted) {
        await Provider.of<FeedProvider>(context, listen: false)
            .updateFeedList();
      }
      if (mounted && widget.showHome) {
        await Provider.of<UserProvider>(context, listen: false)
            .initializeUserData();
      }
    });
  }

  Future<void> checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      connectivityResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: HexColor(dark),
            colorScheme: ColorScheme.fromSeed(
              seedColor: HexColor(primary),
            ),
            useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: connectivityResult.contains(ConnectivityResult.none)
            ? NetworkError()
            : !widget.showHome
                ? Onboarding()
                : Home());
  }
}
