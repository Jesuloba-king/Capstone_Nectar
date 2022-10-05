import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key, required Center child}) : super(key: key);

  final List<String> _myList = List.generate(6, (index) => 'Product $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "My Favorite",
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Add All To Cart',
                                  style: TextStyle(
                                    fontFamily: "Gilroy",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
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
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name of Product",
                      style: TextStyle(
                        fontFamily: "Gilroy-ExtraBold",
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          "355ml, Price",
                          style: TextStyle(
                            fontFamily: "Gilroy-Light",
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Text(
                        "Price",
                        style: TextStyle(
                          fontFamily: "Gilroy-Light",
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_sharp),
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
