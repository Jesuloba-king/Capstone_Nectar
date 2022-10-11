// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:capstone/Logins/sign_in.dart';
import 'package:capstone/Screen/home_screen.dart';
import 'package:capstone/utilities/helper_functions.dart';
import 'package:capstone/widget/app_buttons.dart';
import 'package:capstone/widget/app_texts.dart';
import 'package:capstone/widget/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../API_Services/models/service/auth_service.dart';
import '../widget/spacer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;
  bool isProcessing = false;
  bool obscureText = true;
  bool obscureConfirmPassword = true;
  bool loading = false;
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  bool isChecked = false;
  urlString(String? url) async {
    final link = Uri.parse(url!);
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw 'Could not launch $url';
    }
  }

  static final _fireStore = FirebaseFirestore.instance;

  Future<bool> userExists(String email) async => (await _fireStore
          .collection('Users')
          .where("Email", isEqualTo: email)
          .get())
      .docs
      .isNotEmpty;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final key = GlobalKey<ScaffoldMessengerState>();
    Pattern pattern = '@';
    RegExp regex = RegExp(pattern.toString());
    return Container(
        height: Adaptive.h(12.5),
        width: Adaptive.w(50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/guy.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          key: key,
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: () {
              _focusEmail.unfocus();
              _focusPassword.unfocus();
              _focusConfirmPassword.unfocus();
            },
            child: ListView(
              children: <Widget>[
                Space.spacerH30,
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  padding:
                      EdgeInsets.only(top: width / 11, left: 20, right: 20),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          AppText(
                              text: "Email",
                              textAlign: TextAlign.center,
                              fontSize: Adaptive.sp(18),
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              obscureText: false,
                              focusNode: _focusEmail,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Empty Field';
                                } else if (!regex.hasMatch(value)) {
                                  return 'Enter valid email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: true,
                              enableSuggestions: true,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding: EdgeInsets.only(
                                    top: 0, left: 10, right: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                labelText: 'example@gmail.com',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(199, 199, 199, 1)),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          AppText(
                              text: "Password",
                              textAlign: TextAlign.center,
                              fontSize: Adaptive.sp(18),
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            focusNode: _focusPassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: obscureText,
                            controller: _password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Empty field";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(
                              // textStyle: textTheme.bodyText1,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Gilroy',
                            ),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  top: 0, left: 10, right: 10),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () => setState(() {
                                  obscureText = !obscureText;
                                }),
                                child: Icon(
                                  obscureText
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color:
                                      obscureText ? Colors.grey : Colors.pink,
                                ),
                              ),
                              labelText: 'Password',
                              alignLabelWithHint: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(199, 199, 199, 1)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppText(
                              text: "Confirm Password",
                              textAlign: TextAlign.center,
                              fontSize: Adaptive.sp(18),
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            focusNode: _focusConfirmPassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: obscureConfirmPassword,
                            controller: _confirmPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Empty field";
                              } else if (value != _password.text) {
                                return "Password does not match";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(
                              // textStyle: textTheme.bodyText1,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Gilroy',
                            ),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  top: 0, left: 10, right: 10),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () => setState(() {
                                  obscureConfirmPassword =
                                      !obscureConfirmPassword;
                                }),
                                child: Icon(
                                  obscureConfirmPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: obscureConfirmPassword
                                      ? Colors.grey
                                      : Colors.pink,
                                ),
                              ),
                              labelText: 'Confirm Password',
                              alignLabelWithHint: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(199, 199, 199, 1)),
                            ),
                          ),
                          Space.spacerH50,
                          appButton(
                              onPressed: () async {
                                _focusEmail.unfocus();
                                _focusPassword.unfocus();
                                _focusConfirmPassword.unfocus();
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    isProcessing = true;
                                  });
                                  debugPrint("Email: ${_email.text}");
                                  debugPrint("Password: ${_password.text}");
                                  debugPrint(
                                      "Confirm Password: ${_confirmPassword.text}");

                                  var connectivityResult = await (Connectivity()
                                      .checkConnectivity());
                                  if (connectivityResult ==
                                          ConnectivityResult.mobile ||
                                      connectivityResult ==
                                          ConnectivityResult.wifi) {
                                    bool docExist = await userExists(
                                        _email.text.toString());

                                    if (docExist) {
                                      setState(() {
                                        isProcessing = false;
                                      });
                                      showInfoAlertWithAction(
                                          context,
                                          "User Exist",
                                          "User Email Already Exist",
                                          () {});
                                    } else {
                                      if (isChecked == true) {
                                        bool isValid = await AuthService.signUp(
                                          _email.text.trim(),
                                          _password.text.trim(),
                                        );
                                        if (isValid) {
                                          String userId = AuthService.reUserId;
                                          if (userId.isNotEmpty) {
                                            setState(() {
                                              isProcessing = false;
                                            });
                                            navigateAndRemoveUntilRoute(
                                                context,
                                                HomeScreenPage(
                                                  currentUserId: userId,
                                                ));
                                          } else {
                                            return;
                                          }
                                        }
                                      } else {
                                        setState(() {
                                          isProcessing = false;
                                        });
                                        showInfoAlertWithAction(
                                            context,
                                            "Terms and Conditions",
                                            "Please agree to our terms and conditions to proceed",
                                            () {});
                                      }
                                    }
                                  } else {
                                    setState(() {
                                      isProcessing = false;
                                    });
                                    showInfoAlertWithAction(
                                        context,
                                        "Network Connection",
                                        "No Internet Connection",
                                        () {});
                                  }
                                }
                              },
                              child: isProcessing
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : AppText(
                                      text: "Sign Up",
                                      textAlign: TextAlign.center,
                                      fontSize: Adaptive.sp(18),
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600)),
                          Space.spacerH50,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              AppText(
                                  text: "Or continue with",
                                  textAlign: TextAlign.center,
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          appButton(
                            onPressed: () async {
                              AuthService().signInWithGoogle().then((value) {
                                navigateToRoute(
                                    context,
                                    HomeScreenPage(
                                        currentUserId: value.user!.uid));
                              });
                            },
                            btnColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/google.png"),
                                const SizedBox(
                                  width: 10,
                                ),
                                AppText(
                                    text: "Google",
                                    textAlign: TextAlign.center,
                                    fontSize: Adaptive.sp(18),
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                          ),
                          Space.spacerH50,
                          Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                  text: "Already have an Account?",
                                  textAlign: TextAlign.center,
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    navigateToRoute(
                                        context, const SignInPage());
                                  },
                                  child: AppText(
                                      text: "Login",
                                      textAlign: TextAlign.center,
                                      fontSize: Adaptive.sp(18),
                                      color: AppColors.primary,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
