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
                  //International phone number field
                  Form(
                    key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: const TextStyle(color: Colors.black),
                            initialValue: number,
                            textFieldController: controller,
                            formatInput: false,
                            keyboardType:
                            const TextInputType.numberWithOptions(signed: true, decimal: true),
                            inputBorder: const OutlineInputBorder(),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },

                          ),
                          ElevatedButton(
                            onPressed: () {
                              formKey.currentState?.validate();
                            },
                            child: Text('Validate'),
                          ),
                        ],
                      )
                  ),


                  SizedBox(height: 30,),
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
                  const SizedBox(height: 30,),
                  CupertinoButton(
                      color: const Color(0xff5383EC),
                      borderRadius: const BorderRadius.all(Radius.circular(19)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/pepper.png", height: 30, width: 30,),
                          const Text("Continue with Google",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Colors.white, fontFamily: "Gilroy",
                                fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                            ),),
                        ],
                      ),
                      onPressed: (){}),
                  const SizedBox(height: 30,),
                  CupertinoButton(
                      color: const Color(0xff4A66AC),
                      borderRadius: const BorderRadius.all(Radius.circular(19)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/pepper.png", height: 30, width: 30,),
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
