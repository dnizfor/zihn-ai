import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider({
    this.name = '',
    this.notification = false,
    this.reminder = false,
    this.reminderHours = 0,
    this.reminderMinutes = 0,
  });

  String name;
  bool notification;
  bool reminder;
  int reminderHours;
  int reminderMinutes;

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setNotification(bool newNotification) {
    notification = newNotification;
    notifyListeners();
  }

  void setReminder(
    bool newReminder, [
    int newReminderHours = 0,
    int newReminderMinutes = 0,
  ]) {
    reminder = newReminder;
    reminderHours = newReminderHours;
    reminderMinutes = newReminderMinutes;

    notifyListeners();
  }
}
