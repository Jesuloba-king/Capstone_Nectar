import 'package:capstone/Logins/log_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController? emailJK = TextEditingController();
  TextEditingController? UsernameJK = TextEditingController();
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
    // TODO: implement initState
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
            const SizedBox(height: 60),
            Image.asset("assets/images/Carrot.png", height: 50, width: 50,),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text("Sign Up",
                  style:TextStyle(
                    fontFamily: "Gilroy",
                    fontStyle: FontStyle.normal,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(padding: EdgeInsets.only(left: 10)),
                Text("Enter your credentials to continue",
                  style:TextStyle(
                    fontFamily: "Gilroy",
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff7C7C7C),
                    fontWeight: FontWeight.w500,
                  ),),
              ],
            ),

            //Form Field Column...
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Container(
                    margin: const EdgeInsets.all(8),
                    child: Form(
                      key: formKey,
                      child: Column(
                          children: <Widget>[
                            //Username text form field....
                            Row(
                              // Email address text....
                              children: const [
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Text("Username",
                                  style:TextStyle(
                                    fontFamily: "Gilroy",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ],
                            ),
                            TextFormField(
                              controller: UsernameJK,
                              validator: (String? val){
                                if(val!.isEmpty){
                                  return "username is empty";
                                }
                                return null;
                              },
                              onSaved: (String? username) {
                                UsernameJK = UsernameJK! as TextEditingController?;
                              },
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                                hintText: "enter username",
                                hintStyle: TextStyle(
                                  fontFamily: "Gilroy",
                                ),
                                suffixIcon: Icon(CupertinoIcons.person_solid),
                              ),
                            ),
                            const SizedBox(height: 20,),

                            //Email text form field....
                            Row(
                              // Email address text....
                              children: const [
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Text("Email Address",
                                  style:TextStyle(
                                    fontFamily: "Gilroy",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ],
                            ),
                            TextFormField(
                              controller: emailJK,
                              validator: (String? val){
                                if (val!.isEmpty) {
                                  return "Please enter email address";
                                }
                                if (!RegExp(r'\S+@\S+\.\S+')
                                    .hasMatch(val)) {
                                  return "Please enter valid email address";
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
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                                hintText: "enter email",
                                hintStyle: TextStyle(
                                  fontFamily: "Gilroy",
                                ),
                                suffixIcon: Icon(CupertinoIcons.mail),
                              ),
                            ),

                            //Password field
                            const SizedBox(height: 20,),
                            Row(
                              //Password text....
                              children: const [
                                Padding(padding: EdgeInsets.only(left: 15)),
                                Text("Password",
                                  style:TextStyle(
                                    fontFamily: "Gilroy",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),),
                              ],
                            ),
                            TextFormField(
                              obscureText: _isObscure,
                              controller: passwordJK,
                              validator: (String? val){
                                if(val!.isEmpty){
                                  return "password is empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                                hintText: "password",
                                hintStyle: const TextStyle(
                                  fontFamily: "Gilroy",
                                ),
                                suffixIcon: CupertinoButton(
                                    child: Icon( _isObscure ? CupertinoIcons.eye_slash:CupertinoIcons.eye, color: Colors.black,),
                                    onPressed:(){
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                              ),
                            ),

                            const SizedBox(height: 20),

                            //By continuing you agree to our Terms of Service and Privacy Policy. - Text
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text("By continuing you agree to our Terms of Service and Privacy Policy.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff7C7C7C),
                                  ),
                                ),
                              ],
                            ),

                            //Sign Up button....
                            const SizedBox(height: 30),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    if (formKey.currentState!.validate()) {
                                      showCupertinoDialog(context: context, builder: (BuildContext ctx){
                                        return CupertinoAlertDialog(
                                          title: const Text("Done",style: TextStyle(
                                            fontFamily: "Gilroy",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),),
                                          content: const Text("Validation is passed",style: TextStyle(
                                            fontFamily: "Gilroy",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),),
                                          actions: [
                                            CupertinoButton(child: const Text("cancel", style: TextStyle(
                                              fontFamily: "Gilroy", fontSize: 18, color: Colors.pink,
                                              fontWeight: FontWeight.w500,
                                            ),),
                                              onPressed: (){ Navigator.pop(context);},
                                            ),
                                            CupertinoButton(child: const Text("Proceed", style: TextStyle(
                                              fontFamily: "Gilroy", fontSize: 19, fontWeight: FontWeight.w500,),),
                                                onPressed: () async {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)
                                                  {return const LoginPage();}));
                                                }),
                                          ],
                                        );
                                      });
                                    }
                                    else {
                                      print("unsuccessful");
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 411, height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff53B175),
                                    ),
                                    child: const Text('Sign Up',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Gilroy",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Gilroy-Light",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),),

                                //Log IN Button....
                                CupertinoButton(
                                  onPressed: () async {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return const LoginPage();
                                    }));
                                  },
                                  child: const Text("Log in",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff53B175),
                                    ),),
                                ),
                              ],
                            ),
                          ]
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
