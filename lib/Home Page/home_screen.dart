// ignore_for_file: prefer_const_constructors

import 'package:capstone/models/cart.dart';
import 'package:capstone/models/explore.dart';
import 'package:capstone/models/favorite.dart';
import 'package:capstone/models/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenStatePage();
}

class _HomeScreenStatePage extends State<HomeScreenPage> {
  get searchTec => null;
  int _currentIndex = 0;
  final tabz = [
    const ShopPage(
        child: Center(
      child: Text("Shop"),
    )),
    const ExplorePage(
        child: Center(
      child: Text("Explore"),
    )),
    const CartPage(
        child: Center(
      child: Text("Cart"),
    )),
    const FavoritePage(
        child: Center(
      child: Text("Favorite"),
    )),
    const Center(
      child: Text("Account"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabz[_currentIndex],

      //Bottom Navigation Bar.....
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff53B175),
        selectedLabelStyle: const TextStyle(fontFamily: "Gilroy"),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(fontFamily: "Gilroy"),
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/storeIcon.gif",
              height: 50,
              width: 50,
            ),
            label: "Shop",
          ),
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/discover.gif",
              height: 50,
              width: 50,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/cart.gif",
              height: 45,
              width: 50,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/favorite.gif",
              height: 50,
              width: 50,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/account.gif",
              height: 50,
              width: 50,
            ),
            label: "Account",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
