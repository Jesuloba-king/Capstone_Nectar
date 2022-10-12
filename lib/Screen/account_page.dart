import 'package:capstone/API_Services/models/service/auth_service.dart';
import 'package:capstone/API_Services/models/service/file_storage.dart';
import 'package:capstone/API_Services/models/user_model.dart';
import 'package:capstone/Logins/sign_in.dart';
import 'package:capstone/Screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
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
                                    color: Colors.grey,
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
                                                  onTap: () {},
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
                            const Expanded(
                              child: Divider(
                                indent: 1,
                                color: Colors.black,
                              ),
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
                            const Expanded(
                              child: Divider(
                                indent: 1,
                                color: Colors.black,
                              ),
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
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    //Details class is at the end of this page....
                                    return const Details();
                                  }));
                                }),

                            const Expanded(
                              child: Divider(
                                indent: 1,
                                color: Colors.black,
                              ),
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
                            const Expanded(
                              child: Divider(
                                indent: 1,
                                color: Colors.black,
                              ),
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
                            const Expanded(
                              child: Divider(
                                indent: 1,
                                color: Colors.black,
                              ),
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

                            const Expanded(
                              child: Divider(
                                indent: 1,
                                color: Colors.black,
                              ),
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
                                          onTap: () {
                                            showCupertinoDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return CupertinoAlertDialog(
                                                    title: AppText(
                                                        text: "Exit App",
                                                        fontSize:
                                                            Adaptive.sp(20),
                                                        color: Colors.black,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    content: AppText(
                                                        text:
                                                            "Do you wish to logout?",
                                                        fontSize:
                                                            Adaptive.sp(18),
                                                        color: Colors.black,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    actions: [
                                                      CupertinoButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: AppText(
                                                            text: "cancel",
                                                            fontSize:
                                                                Adaptive.sp(18),
                                                            color: Colors.black,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      CupertinoButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                            return const SignInPage();
                                                          }));
                                                        },
                                                        child: AppText(
                                                            text: "Proceed",
                                                            fontSize:
                                                                Adaptive.sp(18),
                                                            color: Colors.pink,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
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
class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  get address => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            text: "My Details",
            fontSize: Adaptive.sp(23),
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
        elevation: 0.0,
        backgroundColor: Colors.green[100],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
            )),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              height: Adaptive.h(20.5),
              width: Adaptive.w(200),
              color: Colors.lightGreen[100],
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    AppText(
                        text: "Full name",
                        fontSize: Adaptive.sp(20),
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    AppText(
                        text: "Delivery Address",
                        fontSize: Adaptive.sp(18),
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500),
                    AppText(
                        text: "Phone number",
                        fontSize: Adaptive.sp(18),
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
