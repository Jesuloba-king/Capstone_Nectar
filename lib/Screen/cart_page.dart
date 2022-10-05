import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, required this.currentUserId}) : super(key: key);
  final String currentUserId;

  @override
  State<CartPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Find Products",
                  style: TextStyle(
                    fontFamily: "Gilroy-ExtraBold",
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(CupertinoIcons.location_solid),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Location",
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Cart Page",
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
