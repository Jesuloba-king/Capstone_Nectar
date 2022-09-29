import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key, required Center child}) : super(key: key);
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
            const SizedBox(height: 30,),
            //Form Field for search bar....
            TextFormField(
              controller: searchTec,
              onChanged: (String? value){
                // searchProduct(value!);
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                prefixIcon: Icon(CupertinoIcons.search),
                hintText: "Search Store",
                helperStyle: TextStyle(fontFamily: "Gilroy"),
              ),
            ),

            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
