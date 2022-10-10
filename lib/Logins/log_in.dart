import 'package:capstone/Home%20Page/home_screen.dart';
import 'package:capstone/Logins/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController? emailJK = TextEditingController();
  //get User's info from filling of the forms....
  // getUserInfo() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final getEmail = prefs.getString('enter email');
  //
  //
  //   setState(() {
  //     emailJK!.text= getEmail!;
  //   });
  //
  //   if (kDebugMode) {
  //     print(getEmail);
  //   }
  //
  // }

  @override
  void initState() {
    super.initState();
    // getUserInfo();
  }

  get passwordJK => null;
  // toggle to reveal password....
  bool _isObscure = true;
  //Loader...
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/images/Carrot.png",
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  "Log In",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontStyle: FontStyle.normal,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text(
                  "Enter your email and password",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff7C7C7C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            //Form Field Column...
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Form(
                      key: formKey,
                      child: Column(children: <Widget>[
                        Row(
                          // Email address text....
                          children: const [
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "Email Address",
                              style: TextStyle(
                                fontFamily: "Gilroy",
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        //Email text form field....
                        TextFormField(
                          controller: emailJK,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "email is empty";
                            }
                            return null;
                          },
                          onSaved: (String? email) {
                            emailJK = email! as TextEditingController?;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintText: "enter email",
                            hintStyle: TextStyle(
                              fontFamily: "Gilroy",
                            ),
                            suffixIcon: Icon(CupertinoIcons.mail),
                          ),
                        ),

                        //Password field
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          //Password text....
                          children: const [
                            Padding(padding: EdgeInsets.only(left: 15)),
                            Text(
                              "Password",
                              style: TextStyle(
                                fontFamily: "Gilroy",
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          obscureText: _isObscure,
                          controller: passwordJK,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "password is empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            hintText: "password",
                            hintStyle: const TextStyle(
                              fontFamily: "Gilroy",
                            ),
                            suffixIcon: CupertinoButton(
                                child: Icon(
                                  _isObscure
                                      ? CupertinoIcons.eye_slash
                                      : CupertinoIcons.eye,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                          ),
                        ),

                        //Forgotten password button.....
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoButton(
                              onPressed: () async {
                                // Navigator.push(context, MaterialPageRoute(builder: (context){
                                //   return null;
                                // }));
                              },
                              child: const Text(
                                "Forgot Password?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff72567A),
                                ),
                              ),
                            ),
                          ],
                        ),

                        //LogIn button....
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const HomeScreenPage();
                                  }));
                                } else {
                                  if (kDebugMode) {
                                    print("unsuccessful");
                                  }
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 411,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xff53B175),
                                ),
                                child: const Text(
                                  'Log in',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Gilroy",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don’t have an account?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Gilroy-Light",
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),

                            //Sign Up Button....
                            CupertinoButton(
                              onPressed: () async {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const SignUpPage();
                                }));
                              },
                              child: const Text(
                                "Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff53B175),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
