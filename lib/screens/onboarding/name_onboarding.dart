import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/providers/user_provider.dart';
import 'package:zihnai/ultils/color.dart';

class NameOnboarding extends StatefulWidget {
  const NameOnboarding({super.key, required this.onNext, required this.onBack});
  final void Function() onNext;
  final void Function() onBack;

  @override
  NameOnboardingState createState() => NameOnboardingState(); // Removed the leading underscore
}

class NameOnboardingState extends State<NameOnboarding> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = context.read<UserProvider>().name;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onPress() {
      widget.onNext();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.dark,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              BackButton(onPressed: widget.onBack, color: Colors.white),

              // Content Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).onboardingNameTitle,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      S.of(context).onboardingNameSubtitle,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: textController,
                      onChanged: (value) {
                        context.read<UserProvider>().setName(value);
                      },
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Console Section (Arrow Button)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child:
                      context.watch<UserProvider>().name.trim().isNotEmpty
                          ? SizedBox(
                            width: 50,
                            height: 50,
                            child: IconButton(
                              onPressed: onPress,
                              icon: Icon(Icons.arrow_forward), // Arrow icon
                              iconSize: 30,
                              color: CustomColors.dark,
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                          )
                          : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
