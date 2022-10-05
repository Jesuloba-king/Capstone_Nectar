import 'package:capstone/Screen/account_page.dart';
import 'package:capstone/Screen/cart_page.dart';
import 'package:capstone/Screen/explore_page.dart';
import 'package:capstone/Screen/favorite_page.dart';
import 'package:capstone/Screen/shop_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/colors.dart';

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
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            key: scaffoldkey,
            backgroundColor: Colors.white,
            bottomNavigationBar: Container(
              decoration:
                  BoxDecoration(borderRadius: radius, color: AppColors.primary),
              height: width / 6.5,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                indicatorColor: Colors.grey,
                unselectedLabelStyle: const TextStyle(color: Colors.white),
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: width / 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
                isScrollable: false,
                indicatorPadding: const EdgeInsets.only(left: 0, right: 0),
                tabs: <Widget>[
                  Tab(
                    icon: Image.asset(
                      "assets/images/storeIcon.gif",
                      height: 50,
                      width: 50,
                    ),
                    text: 'Shop',
                  ),
                  Tab(
                    icon: Image.asset(
                      "assets/images/discover.gif",
                      height: 50,
                      width: 50,
                    ),
                    text: 'Explore',
                  ),
                  Tab(
                    icon: Image.asset(
                      "assets/images/cart.gif",
                      height: 45,
                      width: 50,
                    ),
                    text: 'Cart',
                  ),
                  Tab(
                    icon: Image.asset(
                      "assets/images/favorite.gif",
                      height: 50,
                      width: 50,
                    ),
                    text: 'Favorite',
                  ),
                  Tab(
                    icon: Image.asset(
                      "assets/images/account.gif",
                      height: 50,
                      width: 50,
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
                ExplorerPage(
                  currentUserId: widget.currentUserId,
                ),
                CartPage(
                  currentUserId: widget.currentUserId,
                ),
                FavoritePage(
                  currentUserId: widget.currentUserId,
                ),
                AccountPage(
                  currentUserId: widget.currentUserId,
                ),
              ],
            )));
  }
}
