import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Utils {
  static Future<void> sendMail(String subject) async {
    final Email email = Email(
      subject: subject,
      recipients: ['zihnai@viralmo.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  static void showSnackbar(
    BuildContext context,
    Color color,
    String title,
    String message,
  ) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: color,
        title: title,
        message: message,

        contentType: ContentType.warning,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
