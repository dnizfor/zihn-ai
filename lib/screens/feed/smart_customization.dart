import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:zihnai/generated/l10n.dart';
import 'package:zihnai/ultils/constant/color.dart';
import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:zihnai/screens/home.dart';

class SmartFeedCustomizationScreen extends StatefulWidget {
  const SmartFeedCustomizationScreen({super.key});

  @override
  State<SmartFeedCustomizationScreen> createState() =>
      _SmartFeedCustomizationScreenState();
}

class _SmartFeedCustomizationScreenState
    extends State<SmartFeedCustomizationScreen> {
  TextEditingController textController = TextEditingController();
  int step = 0;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor(dark),
        appBar: AppBar(
          backgroundColor: HexColor(dark),
          leading:
              step == 0
                  ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: HexColor(white)),
                  )
                  : null,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child:
              step == 0
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).smartAffirmationsTitle,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              S.of(context).smartAffirmationBody,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 20),

                            AnimatedTextField(
                              minLines: 5,
                              maxLines: 7,
                              animationType: Animationtype.typer,
                              hintTextStyle: const TextStyle(
                                color: Colors.grey,
                                overflow: TextOverflow.clip,
                              ),
                              hintTexts: [
                                S.of(context).smartAffirmationsTextFieldHint1,
                                S.of(context).smartAffirmationsTextFieldHint2,
                                S.of(context).smartAffirmationsTextFieldHint3,
                                S.of(context).smartAffirmationsTextFieldHint4,
                                S.of(context).smartAffirmationsTextFieldHint5,
                                S.of(context).smartAffirmationsTextFieldHint6,
                                S.of(context).smartAffirmationsTextFieldHint7,
                              ],
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: HexColor(white),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: HexColor(primary),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                contentPadding: const EdgeInsets.all(12),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Home(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: HexColor(primary),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        S.of(context).generateNowTitle,
                                        style: TextStyle(
                                          color: HexColor(white),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Console Section (Arrow Button)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Align(alignment: Alignment.bottomRight),
                      ),
                    ],
                  )
                  : step == 1
                  ? Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                      size: 150,
                      color: HexColor(white),
                    ),
                  )
                  : Center(
                    child: Lottie.asset(
                      'lib/assets/lotties/successfulAnimation.json',
                      repeat: false,
                      width: 200,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
        ),
      ),
    );
  }
}
