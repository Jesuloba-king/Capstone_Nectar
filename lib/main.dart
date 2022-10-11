// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:capstone/Logins/sign_in.dart';
import 'package:capstone/widget/colors.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'Screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations;
  await Firebase.initializeApp();
  runApp(const NectarApp());
}

class NectarApp extends StatelessWidget {
  const NectarApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Nectar',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.green,
        ),
        home: const SplashScreen1(),
      );
    });
  }
}

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.h(12.5),
      width: Adaptive.w(50),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.primary])),
      child: EasySplashScreen(
        // navigator: const HomeScreenPage(currentUserId: '',),
        navigator: const SignInPage(),
        durationInSeconds: 5,
        loaderColor: Colors.red,
        logo: Image.asset(
          'assets/images/logoCombined.png',
          width: 400,
        ),
        backgroundColor: AppColors.primary,
        logoWidth: 100.0,
        showLoader: true,
      ),
    );
  }
}

class OnboardPage extends StatefulWidget {
  const OnboardPage({
    super.key,
  });

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const SignInPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.primary,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //white carrot logo
              Image.asset("assets/images/logo.png"),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //nectar logo and text
                  Image.asset("assets/images/nectar.png"),
                  const Text(
                    "online groceries",
                    style: TextStyle(
                      letterSpacing: 5.6,
                      fontFamily: "Gilroy",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
