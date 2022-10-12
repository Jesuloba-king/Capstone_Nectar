// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:capstone/API_Services/models/service/auth_service.dart';
import 'package:capstone/API_Services/models/service/file_storage.dart';
import 'package:capstone/API_Services/models/user_model.dart';
import 'package:capstone/Logins/sign_in.dart';
import 'package:capstone/Screen/home_screen.dart';
import 'package:capstone/utilities/helper_functions.dart';
import 'package:capstone/widget/colors.dart';
import 'package:capstone/widget/spacer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widget/app_texts.dart';
import 'cart_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.currentUserId}) : super(key: key);

  final String currentUserId;

  @override
  State<AccountPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<AccountPage> {
  static final _fireStore = FirebaseFirestore.instance;

  File? pickedCv2;
  void handleCVUpload2() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (result != null) {
        setState(() {
          pickedCv2 = File(result.files.single.path.toString());
        });
      }
      String image1 = await StorageService()
          .uploadProfileToStorage("UserProfilePics", pickedCv2!, false);
      UserModel user1 =
          UserModel(uid: widget.currentUserId, profilePicture: image1);
      AuthService.updateProfilePics(user1);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: _fireStore.collection('Users').doc(widget.currentUserId).get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.cyan),
              ),
            );
          }
          UserModel userModel = UserModel.fromSnap(snapshot.data ?? "");
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: AppText(
                  text: "My Account",
                  fontSize: Adaptive.sp(20),
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              child: Container(
                  height: height,
                  width: width,
                  color: Colors.white,
                  child: Scaffold(
                    body: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                width: width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //Image..
                                    pickedCv2 == null
                                        ? GestureDetector(
                                            onTap: () async {
                                              handleCVUpload2();
                                            },
                                            child: CircleAvatar(
                                              radius: 60,
                                              backgroundColor: Colors.grey,
                                              child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 57,
                                                  backgroundImage: userModel
                                                          .profilePicture!
                                                          .isEmpty
                                                      ? const NetworkImage(
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                                                      : userModel.profilePicture ==
                                                              null
                                                          ? const NetworkImage(
                                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Microsoft_Account.svg/512px-Microsoft_Account.svg.png?20170218203212")
                                                          : NetworkImage(
                                                              userModel
                                                                  .profilePicture
                                                                  .toString())),
                                            ),
                                          )
                                        : Center(
                                            child: Stack(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    handleCVUpload2();
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 0),
                                                    child: CircleAvatar(
                                                      radius: 60,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 55,
                                                        backgroundImage:
                                                            FileImage(
                                                                pickedCv2!),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ), //texts
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              userModel.name.toString().isEmpty
                                                  ? AppText(
                                                      text: "@Username",
                                                      fontSize: Adaptive.sp(18),
                                                      color: Colors.black,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  : AppText(
                                                      text: userModel.name
                                                          .toString(),
                                                      fontSize: Adaptive.sp(18),
                                                      color: Colors.black,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500),
                                              InkWell(
                                                  onTap: () {
                                                    navigateToRoute(
                                                        context,
                                                        MyDetailsPage(
                                                          currentUserId: widget
                                                              .currentUserId,
                                                        ));
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/pencil.png',
                                                    height: 20,
                                                    width: 30,
                                                  )),
                                            ],
                                          ),
                                          AppText(
                                              text: userModel.email.toString(),
                                              fontSize: Adaptive.sp(18),
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              indent: 1,
                              color: Colors.black,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.shopping_bag_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                              title: AppText(
                                  text: "Orders",
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const CartPage(
                                    currentUserId: '',
                                  );
                                }));
                              },
                            ),
                            const Divider(
                              indent: 1,
                              color: Colors.black,
                            ),
                            //Orders
                            ListTile(
                                leading: const Icon(
                                  Icons.newspaper,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                title: AppText(
                                    text: "My Details",
                                    fontSize: Adaptive.sp(18),
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                onTap: () {
                                  navigateToRoute(
                                      context,
                                      MyDetailsPage(
                                        currentUserId: widget.currentUserId,
                                      ));
                                }),

                            const Divider(
                              indent: 1,
                              color: Colors.black,
                            ),

                            ListTile(
                              leading: const Icon(
                                CupertinoIcons.tickets,
                                size: 30,
                                color: Colors.black,
                              ),
                              title: AppText(
                                  text: "Promo Code",
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                              onTap: () {
                                showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: AppText(
                                            text: "Promo Code",
                                            fontSize: Adaptive.sp(20),
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500),
                                        content: AppText(
                                            textAlign: TextAlign.center,
                                            text:
                                                "You currently have no available Voucher."
                                                " All your available Vouchers will be displayed here",
                                            fontSize: Adaptive.sp(18),
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500),
                                        actions: [
                                          CupertinoButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: AppText(
                                              text: "cancel",
                                              fontSize: Adaptive.sp(18),
                                              color: Colors.redAccent,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          CupertinoButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return const HomeScreenPage(
                                                  currentUserId: '',
                                                );
                                              }));
                                            },
                                            child: AppText(
                                              text: "Continue Shopping",
                                              fontSize: Adaptive.sp(18),
                                              color: Colors.orangeAccent,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),

                            //Help Column...
                            const Divider(
                              indent: 1,
                              color: Colors.black,
                            ),
                            ListTile(
                              onTap: () {
                                showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: AppText(
                                            text: "Help",
                                            fontSize: Adaptive.sp(20),
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500),
                                        content: AppText(
                                            textAlign: TextAlign.center,
                                            text:
                                                "For more help, contact www.chee-tech.com \n or \nayojesukunumi1@gmail.com",
                                            fontSize: Adaptive.sp(18),
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700),
                                        actions: [
                                          CupertinoButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: AppText(
                                              text: "cancel",
                                              fontSize: Adaptive.sp(18),
                                              color: Colors.redAccent,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              leading: const Icon(
                                Icons.help_outline_sharp,
                                size: 30,
                                color: Colors.black,
                              ),
                              title: AppText(
                                  text: "Help",
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),

                            // About Column...
                            const Divider(
                              indent: 1,
                              color: Colors.black,
                            ),
                            ListTile(
                              onTap: () {
                                showAboutDialog(
                                    context: context,
                                    applicationIcon: Image.asset(
                                      'assets/images/nec.png',
                                      height: 100,
                                    ),
                                    applicationName: 'Nectar Clone',
                                    applicationLegalese: 'Legalese',
                                    applicationVersion: 'version 1.0.0',
                                    children: [
                                      const Text(
                                        'This is an online store application where you can buy products and at the speed of light and get it delivered to your preferred location.'
                                        ' This application is developed by Flutter.',
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                      )
                                    ]);
                              },
                              leading: Image.asset(
                                'assets/icons/info.gif',
                                width: 30,
                              ),
                              title: AppText(
                                  text: "About",
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),

                            const Divider(
                              indent: 1,
                              color: Colors.black,
                            ),

                            // LOG OUT BUTTON...
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //Go to LOG OUT BUTTON...
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        width: 250,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xffF2F3F2),
                                        ),
                                        child: GestureDetector(
                                          onTap: () async {
                                            await showDialog<bool>(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    title: AppText(
                                                        text: "Sign Out",
                                                        fontSize:
                                                            Adaptive.sp(18),
                                                        color: Colors.black,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    content: AppText(
                                                        text:
                                                            "Do you want to sign out?",
                                                        fontSize:
                                                            Adaptive.sp(18),
                                                        color: Colors.black,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    actions: [
                                                      CupertinoDialogAction(
                                                          child: const Text(
                                                              "Proceed"),
                                                          onPressed: () async {
                                                            await FirebaseAuth
                                                                .instance
                                                                .signOut();
                                                            navigateAndRemoveUntilRoute(
                                                                context,
                                                                const SignInPage());
                                                          }),
                                                      CupertinoDialogAction(
                                                          child: const Text(
                                                              "Cancel"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false);
                                                          }),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  'assets/icons/logout.png'),
                                              AppText(
                                                  text: 'Log Out',
                                                  fontSize: Adaptive.sp(20),
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}

//Delivery
class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage({Key? key, required this.currentUserId})
      : super(key: key);
  final String currentUserId;
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<MyDetailsPage> {
  final _formkey = GlobalKey<FormState>();

  late TextEditingController _name;
  late TextEditingController _address;
  late TextEditingController _phoneNo;

  final _focusName = FocusNode();
  final _focusAddress = FocusNode();
  final _focusPhoneNo = FocusNode();

  @override
  void initState() {
    _name = TextEditingController();
    _address = TextEditingController();
    _phoneNo = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    _phoneNo.dispose();
    super.dispose();
  }

  static final _fireStore = FirebaseFirestore.instance;
  Widget create() {
    final key = GlobalKey<ScaffoldMessengerState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: FutureBuilder(
        future: _fireStore.collection('Users').doc(widget.currentUserId).get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.cyan),
              ),
            );
          }
          UserModel userModel = UserModel.fromSnap(snapshot.data ?? "");

          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                _focusName.unfocus();
                _focusAddress.unfocus();
                _focusPhoneNo.unfocus();
                if (_formkey.currentState!.validate()) {
                  setState(() {});
                  debugPrint("Address: ${_name.text}");
                  debugPrint("Nationality: ${_phoneNo.text}");
                  debugPrint("Sex: ${_address.text}");
                  UserModel user = UserModel(
                    uid: widget.currentUserId,
                    name: _name.text.trim(),
                    address: _address.text.trim(),
                    phoneNo: _phoneNo.text.trim(),
                  );
                  AuthService.updateName(user);
                  Navigator.pop(context);
                }
              },
              backgroundColor: const Color(0xff010a3f),
              label: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  AppText(
                      text: "Update",
                      textAlign: TextAlign.center,
                      fontSize: Adaptive.sp(16),
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                  const Icon(
                    Icons.navigate_next_sharp,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              ),
            ),
            key: key,
            backgroundColor: Colors.transparent,
            body: Container(
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  _focusName.unfocus();
                  _focusAddress.unfocus();
                  _focusPhoneNo.unfocus();
                },
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.009,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                AppText(
                                    text: "Back",
                                    textAlign: TextAlign.center,
                                    fontSize: Adaptive.sp(16),
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: AppText(
                          text: "Update Profile",
                          textAlign: TextAlign.center,
                          fontSize: Adaptive.sp(18),
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Form(
                        key: _formkey,
                        child: Column(children: [
                          Space.spacerH5,
                          TextFormField(
                              obscureText: false,
                              focusNode: _focusName,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: userModel.name!.isNotEmpty
                                  ? TextEditingController(text: userModel.name)
                                  : _name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Empty field";
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              enableSuggestions: true,
                              style: const TextStyle(
                                // textStyle: textTheme.bodyText1,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Gilroy',
                              ),
                              decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding: EdgeInsets.only(
                                    top: 0, left: 10, right: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.account_box,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                                labelText: "Name",
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.black),
                              )),
                          Space.spacerH20,
                          TextFormField(
                              obscureText: false,
                              focusNode: _focusPhoneNo,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: userModel.phoneNo!.isNotEmpty
                                  ? TextEditingController(
                                      text: userModel.phoneNo)
                                  : _phoneNo,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Empty field";
                                } else if (value.length != 11) {
                                  return "Invalid Numbers";
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              maxLength: 11,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                // textStyle: textTheme.bodyText1,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Gilroy',
                              ),
                              decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding: EdgeInsets.only(
                                    top: 0, left: 10, right: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                                labelText: ' Mobile Number',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.black),
                              )),
                          Space.spacerH20,
                          TextFormField(
                              obscureText: false,
                              focusNode: _focusAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: userModel.address!.isNotEmpty
                                  ? TextEditingController(
                                      text: userModel.address)
                                  : _address,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Empty field";
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              enableSuggestions: true,
                              style: const TextStyle(
                                // textStyle: textTheme.bodyText1,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Gilroy',
                              ),
                              decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding: EdgeInsets.only(
                                    top: 0, left: 10, right: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.home,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                                labelText: " Address",
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.black),
                              )),
                          Space.spacerH20,
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return create();
  }
}
