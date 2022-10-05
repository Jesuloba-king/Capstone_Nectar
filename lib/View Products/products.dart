import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewProductsPage extends StatelessWidget {
  const ViewProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.square_arrow_left,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.share_solid,
                  size: 30,
                  color: Colors.black,
                ))
          ]),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 270,
                width: 420,
                decoration: BoxDecoration(
                  color: Colors.tealAccent.withOpacity(0.75),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Naturel Red Apple",
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      CupertinoIcons.heart,
                      size: 35,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.remove,
                            size: 40,
                          ),
                          onTap: () {},
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        Container(
                          padding: const EdgeInsets.all(4),
                          child: const Text(
                            "01",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        InkWell(
                          child: const Icon(
                            Icons.add,
                            color: Colors.teal,
                            size: 40,
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                    const Text(
                      "\$4.99",
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Product Details",
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(CupertinoIcons.arrowtriangle_down_fill),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    Text(
                      "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart. As part of a healtful and varied diet.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nutritions",
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          width: 43,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Text(
                            "100gm",
                            style: TextStyle(
                              fontFamily: "Gilroy-Light",
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward_ios_sharp),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reviews",
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffF3603F),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffF3603F),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffF3603F),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffF3603F),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(0xffF3603F),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward_ios_sharp),
                      ],
                    ),
                  ],
                ),
              ),

              //add to basket button....

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 411,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff53B175),
                        ),
                        child: const Text(
                          'Add To Basket',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
