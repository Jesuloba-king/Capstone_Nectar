import 'package:capstone/Logins/verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({Key? key}) : super(key: key);

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/vegz.png",),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  const Text("Get your groceries \n with nectar",
                    style: TextStyle(
                        fontSize: 26, color: Colors.black87, fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                    ),),
                  const SizedBox(height: 30,),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      {
                        return const VerificationPage();
                      }));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.rectangle,
                      ),
                      child: const Text(
                        "Enter your phone number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Gilroy',
                            color: Colors.black),
                      ),
                    ),
                  ),

                  // International phone number field....
                  // Form(
                  //   key: formKey,
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         InternationalPhoneNumberInput(
                  //           onInputChanged: (PhoneNumber number) {
                  //             print(number.phoneNumber);
                  //           },
                  //           onInputValidated: (bool value) {
                  //             print(value);
                  //           },
                  //           formatInput: false,
                  //           keyboardType:
                  //           const TextInputType.numberWithOptions(signed: true, decimal: true),
                  //           inputBorder: const OutlineInputBorder(),
                  //           onSaved: (PhoneNumber number) {
                  //             print('On Saved: $number');
                  //           },
                  //         ),
                  //       ],
                  //     )
                  // ),


                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Or connect with social media",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff828282), fontFamily: "Gilroy",
                          fontStyle: FontStyle.normal,
                        ),),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  //continue with Google button
                  CupertinoButton(
                      color: const Color(0xff5383EC),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/google.png", height: 30, width: 30,),
                          const Text("Continue with Google",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Colors.white, fontFamily: "Gilroy",
                                fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                            ),),
                        ],
                      ),
                      onPressed: (){}),
                  const SizedBox(height: 20,),

                  //continue with facebook button
                  CupertinoButton(
                      color: const Color(0xff4A66AC),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/fb.png", height: 30, width: 30,),
                           const Text("Continue with Facebook",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            fontSize: 18, color: Colors.white, fontFamily: "Gilroy",
                            fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                    ),),
                        ],
                      ),
                      onPressed: (){}
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
