import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/screens/the_main_screen.dart';

class TheSplashScreen extends StatelessWidget {
  static String theRouteName = 'the splash screen';
  const TheSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, TheMainScreen.theRouteName),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash_screen.png'),
                fit: BoxFit.fill)),
      ),
    );
  }
}
