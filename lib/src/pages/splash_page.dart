import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/src/pages/login_page.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/Animation - 1704695893440.json'),
        nextScreen: LoginScreen(),
    pageTransitionType: PageTransitionType.fade,
    );
  }
}
