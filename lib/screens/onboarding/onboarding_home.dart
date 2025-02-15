import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zihnai/ultils/constant/color.dart';

class OnboardingHome extends StatefulWidget {
  const OnboardingHome({super.key, required this.onNext});
  final void Function() onNext;

  @override
  State<OnboardingHome> createState() => _OnboardingHomeState();
}

class _OnboardingHomeState extends State<OnboardingHome> {
  final introKey = GlobalKey<IntroductionScreenState>();
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('lib/assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.grey);
    var pageDecoration = PageDecoration(
        titleTextStyle: const TextStyle(
            fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
        bodyTextStyle: bodyStyle,
        bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: HexColor(dark),
        imagePadding: EdgeInsets.zero,
        imageAlignment: Alignment.bottomCenter,
        bodyAlignment: Alignment.bottomCenter,
        imageFlex: 2,
        bodyFlex: 1);
    return SafeArea(
      child: Scaffold(
          body: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: HexColor(dark),
        allowImplicitScrolling: true,
        infiniteAutoScroll: false,
        pages: [
          PageViewModel(
            title: "Welcome to AI Therapy!",
            body: "Your personal AI-powered well-being companion.",
            image: _buildImage('therapy.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Designed by Doctors",
            body:
                "Our program is created and reviewed by medical professionals for your well-being.",
            image: _buildImage('doctor.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Daily Affirmations",
            body: "Receive positive affirmations tailored to your emotions.",
            image: _buildImage('affirmation.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: widget.onNext,
        showSkipButton: false,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        next: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Arka plan rengi
            shape: BoxShape.circle, // Yuvarlak yapmak için
          ),
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward,
            color: HexColor(dark),
            size: 30,
          ),
        ),
        done: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Arka plan rengi
            shape: BoxShape.circle, // Yuvarlak yapmak için
          ),
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward,
            color: HexColor(dark),
            size: 30,
          ),
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeColor: HexColor(primary),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: ShapeDecoration(
          color: HexColor(dark),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      )),
    );
  }
}
