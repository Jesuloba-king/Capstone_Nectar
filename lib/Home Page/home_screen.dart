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
        iconSize: 35,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_sharp),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_sharp),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
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
