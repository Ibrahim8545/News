import 'package:flutter/material.dart';
import 'package:newsapp/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const String routeName = 'splash';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
         
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
         
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffDFECDB),
      child: Column(
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 211,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
