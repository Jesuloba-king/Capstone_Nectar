import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, required this.currentUserId}) : super(key: key);
  final String currentUserId;

  @override
  State<CartPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<CartPage> {
  final List<String> _myList = List.generate(6, (index) => 'Product $index');
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
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                "My Cart",
                style: TextStyle(
                  fontFamily: "Gilroy-ExtraBold",
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MyPadding(
                              _myList[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: Colors.black,
                            );
                          },
                          itemCount: _myList.length,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Go to Checkout button....
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: 411,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xff53B175),
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        'Go to Checkout',
                                        style: TextStyle(
                                          fontFamily: "Gilroy",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                        ),
                                        child: const Text(
                                          "total price",
                                          style: TextStyle(
                                            fontFamily: "Gilroy-Light",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
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
          )),
    );
  }
}

class MyPadding extends StatelessWidget {
  const MyPadding(String myList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 180,
          width: 620,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black26,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/pepper.png"),
                          fit: BoxFit.contain)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name of Product",
                      style: TextStyle(
                        fontFamily: "Gilroy-ExtraBold",
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        //Minus
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Icon(CupertinoIcons.minus),
                        ),

                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          child: const Text(
                            "01",
                            style: TextStyle(
                              fontFamily: "Gilroy-ExtraBold",
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),

                        //Plus
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Icon(CupertinoIcons.plus),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.cancel),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          child: const Text(
                            "Price",
                            style: TextStyle(
                              fontFamily: "Gilroy-ExtraBold",
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
