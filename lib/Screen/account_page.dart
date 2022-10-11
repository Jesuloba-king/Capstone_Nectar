import 'package:capstone/Logins/sign_in.dart';
import 'package:capstone/Screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widget/app_texts.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.currentUserId}) : super(key: key);
  final String currentUserId;

  @override
  State<AccountPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
            text: "Account Page",
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
                              borderRadius: BorderRadius.circular(20)
                          ),
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Image..
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 100,
                                  backgroundColor: Colors.teal,
                                  child: CircleAvatar(
                                    radius: 95,
                                    backgroundColor: Colors.blueGrey,
                                      child: Image.asset("assets/images/account.png", fit: BoxFit.cover,)
                                  ),
                                ),
                              ),
                              //texts
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                            text: 'Username: ',
                                            fontSize: Adaptive.sp(18),
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset('assets/icons/pencil.png', height: 20, width: 30,)
                                        ),
                                      ],
                                    ),
                                    AppText(
                                        text: "example@gmail.com",
                                        fontSize: Adaptive.sp(18),
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500
                                    ),
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
                        leading: const Icon(Icons.shopping_bag_outlined,
                          size: 30, color: Colors.black,),
                        title: AppText(
                            text: "Orders",
                            fontSize: Adaptive.sp(18),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold
                        ),
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //
                          // }));
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
                        leading: const Icon(Icons.newspaper,
                          size: 30, color: Colors.black,),
                        title: AppText(
                            text: "My Details",
                            fontSize: Adaptive.sp(18),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold
                        ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
                            {
                              //Details class is at the end of this page....
                              return const Details();
                            }));
                          }
                      ),

                      const Expanded(
                        child: Divider(
                          indent: 1,
                          color: Colors.black,
                        ),
                      ),

                      ListTile(
                        leading: const Icon(CupertinoIcons.tickets,
                          size: 30, color: Colors.black,),
                        title: AppText(
                            text: "Promo Code",
                            fontSize: Adaptive.sp(18),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold
                        ),
                        onTap: (){
                          showCupertinoDialog(context: context, builder: (BuildContext context){
                            return CupertinoAlertDialog(
                              title: AppText(
                                  text: "Promo Code",
                                  fontSize: Adaptive.sp(20),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500
                              ),
                              content: AppText(
                                  textAlign: TextAlign.center,
                                  text: "You currently have no available Voucher."
                                  " All your available Vouchers will be displayed here",
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500
                              ),
                              actions: [
                                CupertinoButton(onPressed: () {Navigator.pop(context);},
                                  child: AppText(
                                    text: "cancel",
                                    fontSize: Adaptive.sp(18),
                                    color: Colors.redAccent,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                  ),),
                                CupertinoButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return const HomeScreenPage(currentUserId: '',);
                                }));},
                                  child: AppText(
                                    text: "Continue Shopping",
                                    fontSize: Adaptive.sp(18),
                                    color: Colors.orangeAccent,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),),
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
                        onTap: (){
                          showCupertinoDialog(context: context, builder: (BuildContext context){
                            return CupertinoAlertDialog(
                              title: AppText(
                                  text: "Help",
                                  fontSize: Adaptive.sp(20),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500
                              ),
                              content: AppText(
                                textAlign: TextAlign.center,
                                  text: "For more help, contact www.chee-tech.com \n or \nayojesukunumi1@gmail.com",
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700
                              ),
                              actions: [
                                CupertinoButton(onPressed: () {Navigator.pop(context);},
                                  child: AppText(
                                      text: "cancel",
                                      fontSize: Adaptive.sp(18),
                                      color: Colors.redAccent,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                  ),),
                              ],
                            );
                          });
                        },
                        leading: const Icon(Icons.help_outline_sharp,
                          size: 30, color: Colors.black,),
                        title: AppText(
                            text: "Help",
                            fontSize: Adaptive.sp(18),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      // About Column...
                      const Expanded(
                        child: Divider(
                          indent: 1,
                          color: Colors.black,
                        ),
                      ),
                      ListTile(
                        onTap: (){
                         showAboutDialog(context: context,
                         applicationIcon: Image.asset('assets/images/nec.png', height: 100,),
                           applicationName: 'Nectar Clone',
                           applicationLegalese: 'Legalese',
                           applicationVersion: 'version 1.0.0',
                           children: [
                             const Text('This is an online store application where you can buy products and at the speed of light and get it delivered to your preferred location.'
                               ' This application is developed by Flutter.',
                               softWrap: true, textAlign: TextAlign.center,)
                           ]
                         );
                        },
                        leading: Image.asset('assets/icons/info.gif', width: 30,),
                        title: AppText(
                            text: "About",
                            fontSize: Adaptive.sp(18),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold
                        ),
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
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xffF2F3F2),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      showCupertinoDialog(context: context,
                                          builder: (BuildContext context){
                                        return CupertinoAlertDialog(
                                          title: AppText(
                                              text: "Exit App",
                                              fontSize: Adaptive.sp(20),
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500
                                          ),
                                          content: AppText(
                                              text: "Do you wish to logout?",
                                              fontSize: Adaptive.sp(18),
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500
                                          ),
                                          actions: [
                                            CupertinoButton(onPressed: () {Navigator.pop(context);},
                                              child: AppText(
                                                text: "cancel",
                                                fontSize: Adaptive.sp(18),
                                                color: Colors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500
                                            ),),
                                            CupertinoButton(onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                                return const SignInPage();}));},
                                              child: AppText(
                                                  text: "Proceed",
                                                  fontSize: Adaptive.sp(18),
                                                  color: Colors.pink,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500
                                              ),),
                                          ],
                                        );
                                          });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/icons/logout.png'),
                                        AppText(
                                            text: 'Log Out',
                                            fontSize: Adaptive.sp(20),
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold
                                        ),
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
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.back,)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )
        ),
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
                        fontWeight: FontWeight.bold
                    ),

                    AppText(
                        text: "Delivery Address",
                        fontSize: Adaptive.sp(18),
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),

                    AppText(
                        text: "Phone number",
                        fontSize: Adaptive.sp(18),
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
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
