import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key, required Center child}) : super(key: key);

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
                    fontWeight: FontWeight.w600,
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
                prefixIcon: Icon(CupertinoIcons.search),
                hintText: "Search Store",
                helperStyle: TextStyle(fontFamily: "Gilroy"),
              ),
            ),

            const SizedBox(height: 10,),

            //Advert with Linear Gradient....
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
                          fontWeight: FontWeight.w700,
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

            // Exclusive offer Row..
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(padding: EdgeInsets.all(3)),
                const Text("Exclusive Offer",
                  style:TextStyle(
                    fontFamily: "Gilroy-ExtraBold",
                    fontStyle: FontStyle.normal,
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 120,),

                //See all Button to show all items in Exclusive offer....
                SizedBox(
                  height: 50,
                  width: 80,
                  child: CupertinoButton(
                      child: const Text("See all",
                    style:TextStyle(
                      fontFamily: "Gilroy-Light",
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff53B175),
                      fontWeight: FontWeight.w600,
                    ),
                  ), onPressed: (){}),
                ),
              ],
            ),


            //1st List item - Container containing products...
            Container(
              height: 260,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF5F5F5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Image.asset("assets/images/banana.png"),
                          ),
                        ),
                        SizedBox(height: 15,),

                        //Organic Banana text Container
                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: const Text("Organic Bananas",
                            style:TextStyle(
                              fontFamily: "Gilroy",
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 1, left: 7),
                          alignment: Alignment.centerLeft,
                          // padding: const EdgeInsets.only(bottom: 8),
                          child: const Text("7pcs, Price",
                            style:TextStyle(
                              fontFamily: "Gilroy-Light",
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("\$4.99",
                                style:TextStyle(
                                  fontFamily: "Gilroy-ExtraBold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff53B175),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(CupertinoIcons.add, size: 35, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF5F5F5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Image.asset("assets/images/pepper.png"),
                          ),
                        ),
                        SizedBox(height: 15,),

                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: const Text("Naturel Red Apple",
                            style:TextStyle(
                              fontFamily: "Gilroy",
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 1, left: 7),
                          alignment: Alignment.centerLeft,
                          // padding: const EdgeInsets.only(bottom: 8),
                          child:  const Text("1kg, Price",
                            style:TextStyle(
                              fontFamily: "Gilroy-Light",
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("\$4.99",
                                style:TextStyle(
                                  fontFamily: "Gilroy-ExtraBold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff53B175),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(CupertinoIcons.add, size: 35, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF5F5F5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Image.asset("assets/images/banana.png"),
                          ),
                        ),
                        SizedBox(height: 15,),

                        //Organic Banana text Container
                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: const Text("Organic Bananas",
                            style:TextStyle(
                              fontFamily: "Gilroy",
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 1, left: 7),
                          alignment: Alignment.centerLeft,
                          // padding: const EdgeInsets.only(bottom: 8),
                          child: const Text("7pcs, Price",
                            style:TextStyle(
                              fontFamily: "Gilroy-Light",
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("\$4.99",
                                style:TextStyle(
                                  fontFamily: "Gilroy-ExtraBold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff53B175),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(CupertinoIcons.add, size: 35, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Best Selling Category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(padding: EdgeInsets.all(3)),
                const Text("Best Selling",
                  style:TextStyle(
                    fontFamily: "Gilroy-ExtraBold",
                    fontStyle: FontStyle.normal,
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 160,),

                //See all Button to show all items in Best Selling Categories....
                SizedBox(
                  height: 50,
                  width: 80,
                  child: CupertinoButton(
                      child: const Text("See all",
                        style:TextStyle(
                          fontFamily: "Gilroy-Light",
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff53B175),
                          fontWeight: FontWeight.w600,
                        ),
                      ), onPressed: (){}),
                ),
              ],
            ),

            //2nd List item - Container containing products...
            Container(
              height: 260,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF5F5F5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Image.asset("assets/images/pepper.png"),
                          ),
                        ),
                        SizedBox(height: 15,),

                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: const Text("Bell Pepper Red",
                            style:TextStyle(
                              fontFamily: "Gilroy",
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 1, left: 7),
                          alignment: Alignment.centerLeft,
                          // padding: const EdgeInsets.only(bottom: 8),
                          child:  const Text("1kg, Price",
                            style:TextStyle(
                              fontFamily: "Gilroy-Light",
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("\$4.99",
                                style:TextStyle(
                                  fontFamily: "Gilroy-ExtraBold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff53B175),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(CupertinoIcons.add, size: 35, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF5F5F5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Image.asset("assets/images/ginger.png"),
                          ),
                        ),
                        SizedBox(height: 15,),

                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: const Text("Ginger",
                            style:TextStyle(
                              fontFamily: "Gilroy",
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 1, left: 7),
                          alignment: Alignment.centerLeft,
                          child:  const Text("250gm, Price",
                            style:TextStyle(
                              fontFamily: "Gilroy-Light",
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("\$2.99",
                                style:TextStyle(
                                  fontFamily: "Gilroy-ExtraBold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff53B175),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(CupertinoIcons.add, size: 35, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF5F5F5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Image.asset("assets/images/banana.png"),
                          ),
                        ),
                        SizedBox(height: 15,),

                        //Organic Banana text Container
                        Container(
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: const Text("Organic Bananas",
                            style:TextStyle(
                              fontFamily: "Gilroy",
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 1, left: 7),
                          alignment: Alignment.centerLeft,
                          // padding: const EdgeInsets.only(bottom: 8),
                          child: const Text("7pcs, Price",
                            style:TextStyle(
                              fontFamily: "Gilroy-Light",
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("\$4.99",
                                style:TextStyle(
                                  fontFamily: "Gilroy-ExtraBold",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff53B175),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(CupertinoIcons.add, size: 35, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
