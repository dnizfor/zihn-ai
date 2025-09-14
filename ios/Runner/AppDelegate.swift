import Flutter
import UIKit
import flutter_local_notifications
import workmanager_apple
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
        GeneratedPluginRegistrant.register(with: registry)
    }
    if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)
WorkmanagerPlugin.registerPeriodicTask(
  withIdentifier: "com.viralmo.zihnai.periodic_task",
  frequency: NSNumber(value:  4 * 60 * 60) 
)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
