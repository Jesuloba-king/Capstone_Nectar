import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key, required Center child}) : super(key: key);
  get searchTec => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text("Find Products",
              style:TextStyle(
                fontFamily: "Gilroy-ExtraBold",
                fontStyle: FontStyle.normal,
                fontSize: 20,
              ),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(CupertinoIcons.location_solid),
                SizedBox(height: 30,),
                Text("Location",
                  style:TextStyle(
                    fontFamily: "Gilroy",
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text("Cart Page", style: TextStyle(fontSize: 50),),
          ],
        ),
      ),
    );
  }
}
