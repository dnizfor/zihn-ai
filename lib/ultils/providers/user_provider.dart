import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zihnai/ultils/enums/subscription_status_enum.dart';

class UserProvider extends ChangeNotifier {
  UserProvider({
    this.name = '',
    this.notification = false,
    this.reminder = false,
    this.reminderHours = 0,
    this.reminderMinutes = 0,
    this.userSubscriptionStatus = SubscriptionStatus.loading,
  });

  String name;
  bool notification;
  bool reminder;
  int reminderHours;
  int reminderMinutes;
  SubscriptionStatus userSubscriptionStatus;

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setNotification(bool newNotification) {
    notification = newNotification;
    notifyListeners();
  }

  void setReminder(bool newReminder) {
    reminder = newReminder;

    notifyListeners();
  }

  void setReminderHours(int newReminderHours) {
    reminderHours = newReminderHours;

    notifyListeners();
  }

  void setReminderMinutes(int newReminderMinutes) {
    reminderMinutes = newReminderMinutes;

    notifyListeners();
  }

  Future<void> checkPremiumStatus() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    final premiumEntitlement = customerInfo.entitlements.all["premium"];
    if (premiumEntitlement != null && premiumEntitlement.isActive) {
      userSubscriptionStatus = SubscriptionStatus.premium;
    } else {
      userSubscriptionStatus = SubscriptionStatus.basic;
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>?> initializeUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userDataString = prefs.getString('user');

    Map<String, dynamic>? userData = jsonDecode(userDataString!);
    name = userData?['name'];
    notification = userData?['notification'];
    reminder = userData?['reminder'];
    reminderHours = userData?['reminderHours'];
    reminderMinutes = userData?['reminderMinutes'];

    checkPremiumStatus();

    return null;
  }
}
