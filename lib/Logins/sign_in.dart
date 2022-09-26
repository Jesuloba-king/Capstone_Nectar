import 'package:capstone/Logins/number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/guy.png",),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //white carrot logo
              Image.asset("assets/images/logo.png",),
              const SizedBox(height: 10,),
              const Text("Welcome \n to our store",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40, color: Colors.white, fontFamily: "Gilroy",
                  fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
              ),),
              const Text("Get your groceries in as fast as one hour",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: "Gilroy-light",
                    fontStyle: FontStyle.normal,
                ),),
              const SizedBox(height: 30,),
              CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.circular(19)),
                  color: const Color(0xff53B175),
                  child: const Text("Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18, color: Colors.white, fontFamily: "Gilroy",
                  fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                ),), 
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    {return const NumberPage();}));
                  },
              ),
              const Padding(padding: EdgeInsets.only(top: 90))
            ],
          ),
        ),
      ),
    );
  }
}
