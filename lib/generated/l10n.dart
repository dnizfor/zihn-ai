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

  /// `Oops! No Internet`
  String get networkErrorTitle {
    return Intl.message(
      'Oops! No Internet',
      name: 'networkErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Get Premium Benefits`
  String get paywallTitle {
    return Intl.message(
      'Get Premium Benefits',
      name: 'paywallTitle',
      desc: '',
      args: [],
    );
  }

  /// `Advanced AI Experience`
  String get firstBenefitTitle {
    return Intl.message(
      'Advanced AI Experience',
      name: 'firstBenefitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Voice Assistant Support`
  String get secondBenefitTitle {
    return Intl.message(
      'Voice Assistant Support',
      name: 'secondBenefitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Customizable Affirmations`
  String get thirdBenefitTitle {
    return Intl.message(
      'Customizable Affirmations',
      name: 'thirdBenefitTitle',
      desc: '',
      args: [],
    );
  }

  /// `Yearly`
  String get yearlyOfferTitle {
    return Intl.message('Yearly', name: 'yearlyOfferTitle', desc: '', args: []);
  }

  /// `%80 Discount`
  String get discountLabel {
    return Intl.message(
      '%80 Discount',
      name: 'discountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get monthlyOfferTitle {
    return Intl.message(
      'Monthly',
      name: 'monthlyOfferTitle',
      desc: '',
      args: [],
    );
  }

  /// `No commitment, cancel anytime.`
  String get noCommitmentText {
    return Intl.message(
      'No commitment, cancel anytime.',
      name: 'noCommitmentText',
      desc: '',
      args: [],
    );
  }

  /// `Try Now`
  String get payNowTitle {
    return Intl.message('Try Now', name: 'payNowTitle', desc: '', args: []);
  }

  /// `You will be charged at the time of purchase and will renew automatically at the end of the billing period unless cancelled.`
  String get renewalInfoText {
    return Intl.message(
      'You will be charged at the time of purchase and will renew automatically at the end of the billing period unless cancelled.',
      name: 'renewalInfoText',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get feedCustomizationScreenAppBarTitle {
    return Intl.message(
      'Categories',
      name: 'feedCustomizationScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Generate with AI`
  String get generateWithAiTitle {
    return Intl.message(
      'Generate with AI',
      name: 'generateWithAiTitle',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get categoryCardGeneral {
    return Intl.message(
      'General',
      name: 'categoryCardGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Stress and Anxiety`
  String get categoryCardAnxiety {
    return Intl.message(
      'Stress and Anxiety',
      name: 'categoryCardAnxiety',
      desc: '',
      args: [],
    );
  }

  /// `Finding Love`
  String get categoryCardLove {
    return Intl.message(
      'Finding Love',
      name: 'categoryCardLove',
      desc: '',
      args: [],
    );
  }

  /// `Personal Development`
  String get categoryCardGrowth {
    return Intl.message(
      'Personal Development',
      name: 'categoryCardGrowth',
      desc: '',
      args: [],
    );
  }

  /// `Positive Thinking`
  String get categoryCardOptimistic {
    return Intl.message(
      'Positive Thinking',
      name: 'categoryCardOptimistic',
      desc: '',
      args: [],
    );
  }

  /// `Body Affirmation`
  String get categoryCardBodyAffirmation {
    return Intl.message(
      'Body Affirmation',
      name: 'categoryCardBodyAffirmation',
      desc: '',
      args: [],
    );
  }

  /// `Tough Days`
  String get categoryCardtoughDays {
    return Intl.message(
      'Tough Days',
      name: 'categoryCardtoughDays',
      desc: '',
      args: [],
    );
  }

  /// `Self-confidence`
  String get categoryCardSelfConfidence {
    return Intl.message(
      'Self-confidence',
      name: 'categoryCardSelfConfidence',
      desc: '',
      args: [],
    );
  }

  /// `Happiness`
  String get categoryCardHappiness {
    return Intl.message(
      'Happiness',
      name: 'categoryCardHappiness',
      desc: '',
      args: [],
    );
  }

  /// `Work Success`
  String get categoryWorkSuccess {
    return Intl.message(
      'Work Success',
      name: 'categoryWorkSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Calmness`
  String get categoryCardCalmness {
    return Intl.message(
      'Calmness',
      name: 'categoryCardCalmness',
      desc: '',
      args: [],
    );
  }

  /// `Gratitude`
  String get categoryCardGratitude {
    return Intl.message(
      'Gratitude',
      name: 'categoryCardGratitude',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get categoryCardHealth {
    return Intl.message(
      'Health',
      name: 'categoryCardHealth',
      desc: '',
      args: [],
    );
  }

  /// `Love Yourself`
  String get categoryCardSelfLove {
    return Intl.message(
      'Love Yourself',
      name: 'categoryCardSelfLove',
      desc: '',
      args: [],
    );
  }

  /// `Smart Affirmations`
  String get smartAffirmationsTitle {
    return Intl.message(
      'Smart Affirmations',
      name: 'smartAffirmationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Write your thoughts, feelings, goals, and experiences here. Based on the information you provide, AI will generate personalized affirmations for you.`
  String get smartAffirmationBody {
    return Intl.message(
      'Write your thoughts, feelings, goals, and experiences here. Based on the information you provide, AI will generate personalized affirmations for you.',
      name: 'smartAffirmationBody',
      desc: '',
      args: [],
    );
  }

  /// `My motivation is low these days.`
  String get smartAffirmationsTextFieldHint1 {
    return Intl.message(
      'My motivation is low these days.',
      name: 'smartAffirmationsTextFieldHint1',
      desc: '',
      args: [],
    );
  }

  /// `I want to feel more confident.`
  String get smartAffirmationsTextFieldHint2 {
    return Intl.message(
      'I want to feel more confident.',
      name: 'smartAffirmationsTextFieldHint2',
      desc: '',
      args: [],
    );
  }

  /// `I want to become a doctor.`
  String get smartAffirmationsTextFieldHint3 {
    return Intl.message(
      'I want to become a doctor.',
      name: 'smartAffirmationsTextFieldHint3',
      desc: '',
      args: [],
    );
  }

  /// `I am preparing for an important exam right now.`
  String get smartAffirmationsTextFieldHint4 {
    return Intl.message(
      'I am preparing for an important exam right now.',
      name: 'smartAffirmationsTextFieldHint4',
      desc: '',
      args: [],
    );
  }

  /// `I was constantly excluded during my childhood.`
  String get smartAffirmationsTextFieldHint5 {
    return Intl.message(
      'I was constantly excluded during my childhood.',
      name: 'smartAffirmationsTextFieldHint5',
      desc: '',
      args: [],
    );
  }

  /// `Create affirmations for love.`
  String get smartAffirmationsTextFieldHint6 {
    return Intl.message(
      'Create affirmations for love.',
      name: 'smartAffirmationsTextFieldHint6',
      desc: '',
      args: [],
    );
  }

  /// `My family does not understand me.`
  String get smartAffirmationsTextFieldHint7 {
    return Intl.message(
      'My family does not understand me.',
      name: 'smartAffirmationsTextFieldHint7',
      desc: '',
      args: [],
    );
  }

  /// `Generate Now!`
  String get generateNowTitle {
    return Intl.message(
      'Generate Now!',
      name: 'generateNowTitle',
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
