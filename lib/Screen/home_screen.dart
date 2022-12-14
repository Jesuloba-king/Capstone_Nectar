import 'package:capstone/Screen/account_page.dart';
import 'package:capstone/Screen/cart_page.dart';
import 'package:capstone/Screen/shop_page.dart';
import 'package:capstone/widget/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widget/colors.dart';
import 'favorite_product.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key, required this.currentUserId})
      : super(key: key);
  final String currentUserId;

  @override
  State<HomeScreenPage> createState() => _HomeScreenStatePage();
}

class _HomeScreenStatePage extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    var scaffoldkey = GlobalKey<ScaffoldState>();
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: AppText(
                    text: "Quit Nectar App?",
                    fontSize: Adaptive.sp(18),
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
                content: AppText(
                    text: "Are you sure you want to quit Nectar App?",
                    fontSize: Adaptive.sp(18),
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
                actions: [
                  CupertinoDialogAction(
                      child: const Text("Proceed"),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      }),
                  CupertinoDialogAction(
                      child: const Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      }),
                ],
              );
            });
        return shouldPop!;
      },
      child: DefaultTabController(
          length: 4,
          child: Scaffold(
              key: scaffoldkey,
              backgroundColor: Colors.white,
              bottomNavigationBar: Container(
                decoration:
                    BoxDecoration(borderRadius: radius, color: AppColors.grey),
                height: width / 6.5,
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                  indicatorColor: Colors.white,
                  unselectedLabelStyle: const TextStyle(color: Colors.white),
                  labelColor: Colors.black,
                  labelStyle: TextStyle(
                    fontSize: width / 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                  isScrollable: false,
                  indicatorPadding: const EdgeInsets.only(left: 0, right: 0),
                  tabs: <Widget>[
                    Tab(
                      icon: Image.asset(
                        "assets/images/storeIcon.gif",
                        height: 30,
                        width: 30,
                      ),
                      text: 'Shop',
                    ),
                    Tab(
                      icon: Image.asset(
                        "assets/images/cart.gif",
                        height: 30,
                        width: 30,
                      ),
                      text: 'Cart',
                    ),
                    Tab(
                      icon: Image.asset(
                        "assets/images/favorite.gif",
                        height: 30,
                        width: 30,
                      ),
                      text: 'Favorite',
                    ),
                    Tab(
                      icon: Image.asset(
                        "assets/images/account.png",
                        height: 30,
                        width: 30,
                      ),
                      text: 'Account',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  ShopPage(
                    currentUserId: widget.currentUserId,
                  ),
                  CartPage(
                    currentUserId: widget.currentUserId,
                  ),
                  FavoriteProductPage(
                    currentUserId: widget.currentUserId,
                  ),
                  AccountPage(
                    currentUserId: widget.currentUserId,
                  ),
                ],
              ))),
    );
  }
}
