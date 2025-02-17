import 'package:flutter_email_sender/flutter_email_sender.dart';

Future<void> sendMail(String subject) async {
  final Email email = Email(
    subject: subject,
    recipients: ['team@lingovido.com'],
    isHTML: false,
  );

  await FlutterEmailSender.send(email);
}
