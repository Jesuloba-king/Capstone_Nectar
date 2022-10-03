import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required Center child}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 5),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xffFDCF09),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/pepper.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Username",
                            style: TextStyle(
                              fontFamily: "Gilroy-Light",
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                "@email.com",
                                style: TextStyle(
                                  fontFamily: "Gilroy-Light",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //Edit icon button....
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 70.0,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: const [
                            Icon(CupertinoIcons.pen, color: Color(0xff53B175)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 1,
                color: Colors.black,
              ),
              //Orders
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Orders",
                      style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(
                indent: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.newspaper,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "My Details",
                      style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Deleivery address...
              const Divider(
                indent: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.location_solid,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Delivery Address",
                      style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Pay,ent column...
              const Divider(
                indent: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.creditcard,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Payment Methods",
                      style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Promo Column...
              const Divider(
                indent: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.tickets,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Promo Code",
                      style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Notification Column...
              const Divider(
                indent: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.notifications_on_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Help Column
              const Divider(
                indent: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.help_outline_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Help",
                      style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //About Column
              const Divider(
                indent: 1,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error_outline_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "About",
                      style: TextStyle(
                        fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: InkWell(
                  onTap: () {},
                ),
              ),
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
                          width: 400,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffF2F3F2),
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.logout,
                                  color: Color(0xff53B175),
                                  size: 35,
                                ),
                                Text(
                                  'Log Out',
                                  style: TextStyle(
                                    fontFamily: "Gilroy",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff53B175),
                                  ),
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
    );
  }
}
