import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required Center child}) : super(key: key);

  get searchTec => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Image.asset("assets/images/Carrot.png", height: 30, width: 30,),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(CupertinoIcons.location_solid),
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
                prefixIcon: Icon(CupertinoIcons.search_circle),
                hintText: "Search Store",
                helperStyle: TextStyle(fontFamily: "Gilroy"),
              ),
            ),

            const SizedBox(height: 10,),

            Container(
              padding: const EdgeInsets.all(10),
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFFF6EFE9),Color(0xFFFACCCC)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.2, 1.0],
                  tileMode: TileMode.repeated,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/flower.png", width: 40,),
                  Image.asset("assets/images/fruits.png"),
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(padding: EdgeInsets.only(right:100,left: 80)),
                      Text("Fresh Vegetables",
                        style:TextStyle(
                          fontFamily: "Gilroy",
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),),
                      Text("Get Up To 40% OFF",
                        style:TextStyle(
                          fontFamily: "Gilroy",
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff53B175),
                          fontWeight: FontWeight.w500,
                        ),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/images/leaf.png", width: 35,),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
