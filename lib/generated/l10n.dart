// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to AI Therapy!`
  String get onboardingHomeTherapyTitle {
    return Intl.message(
      'Welcome to AI Therapy!',
      name: 'onboardingHomeTherapyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your personal AI-powered well-being companion.`
  String get onboardingHomeTherapyBody {
    return Intl.message(
      'Your personal AI-powered well-being companion.',
      name: 'onboardingHomeTherapyBody',
      desc: '',
      args: [],
    );
  }

  /// `Designed by Doctors`
  String get onboardingHomeDoctorTitle {
    return Intl.message(
      'Designed by Doctors',
      name: 'onboardingHomeDoctorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Our program is created and reviewed by medical professionals for your well-being.`
  String get onboardingHomeDoctorBody {
    return Intl.message(
      'Our program is created and reviewed by medical professionals for your well-being.',
      name: 'onboardingHomeDoctorBody',
      desc: '',
      args: [],
    );
  }

  /// `Daily Affirmations`
  String get onboardingHomeAffirmationTitle {
    return Intl.message(
      'Daily Affirmations',
      name: 'onboardingHomeAffirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Receive positive affirmations tailored to your emotions.`
  String get onboardingHomeAffirmationBody {
    return Intl.message(
      'Receive positive affirmations tailored to your emotions.',
      name: 'onboardingHomeAffirmationBody',
      desc: '',
      args: [],
    );
  }

  /// `What is your name?`
  String get onboardingNameTitle {
    return Intl.message(
      'What is your name?',
      name: 'onboardingNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name so that we can address you properly.`
  String get onboardingNameSubtitle {
    return Intl.message(
      'Please enter your name so that we can address you properly.',
      name: 'onboardingNameSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Set Therapy Reminder`
  String get onboardingReminderTitle {
    return Intl.message(
      'Set Therapy Reminder',
      name: 'onboardingReminderTitle',
      desc: '',
      args: [],
    );
  }

  /// `We will send a reminder at your designated time to ensure your daily therapy process is not disrupted.`
  String get onboardingReminderSubtitle {
    return Intl.message(
      'We will send a reminder at your designated time to ensure your daily therapy process is not disrupted.',
      name: 'onboardingReminderSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Enable Therapy Reminder`
  String get reminderButtonTitle {
    return Intl.message(
      'Enable Therapy Reminder',
      name: 'reminderButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Set reminders for your therapy.`
  String get timePickerDescription {
    return Intl.message(
      'Set reminders for your therapy.',
      name: 'timePickerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ready to Talk? 😊`
  String get reminderNotificationTitle {
    return Intl.message(
      'Ready to Talk? 😊',
      name: 'reminderNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `It's time to chat with your psychologist! Share your feelings and relax. 🌸`
  String get reminderNotificationBody {
    return Intl.message(
      'It`s time to chat with your psychologist! Share your feelings and relax. 🌸',
      name: 'reminderNotificationBody',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Be Premium!`
  String get goPremiumButtonTitle {
    return Intl.message(
      'Be Premium!',
      name: 'goPremiumButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notificationSettingsButtonTitle {
    return Intl.message(
      'Notifications',
      name: 'notificationSettingsButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us!`
  String get rateUsButtonTitle {
    return Intl.message(
      'Rate Us!',
      name: 'rateUsButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Support & Feedback`
  String get supportButtonTitle {
    return Intl.message(
      'Support & Feedback',
      name: 'supportButtonTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
