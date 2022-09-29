import 'dart:async';

import 'package:capstone/Logins/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NectarApp());
}

class NectarApp extends StatelessWidget {
  const NectarApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nectar',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: const OnboardPage(title: 'Online Store'),
    );
  }
}

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key, required this.title});

  final String title;

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),
        ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const SignInPage()))
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff53B175),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //white carrot logo
              Image.asset("assets/images/logo.png"),
              const SizedBox(width: 12,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //nectar logo and text
                  Image.asset("assets/images/nectar.png"),
                  const Text("online groceries",
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
