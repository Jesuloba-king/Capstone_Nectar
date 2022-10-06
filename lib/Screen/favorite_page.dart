import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, required this.currentUserId}) : super(key: key);
  final String currentUserId;

  @override
  State<FavoritePage> createState() => _ShopPageState();
}

class _ShopPageState extends State<FavoritePage> {
  late TextEditingController searchTec;

  @override
  void initState() {
    searchTec = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    searchTec.dispose();

    super.dispose();
  }

  final List<String> _myList = List.generate(6, (index) => 'Product $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Device.screenType == ScreenType.tablet
          ? Container(
              height: 20.5.h,
              width: 100.w,
              color: Colors.white,
              child: Scaffold(
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
                body: Column(
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
            )
          : Container(
              width: 100.w,
              height: 12.5.h,
              color: Colors.white,
              child: Scaffold(
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
                body: Column(
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
