import 'dart:async';
import 'dart:convert';
import 'package:capstone/Screen/product_views/elctronics_page.dart';
import 'package:capstone/Screen/product_views/exclusive_offer_page.dart';
import 'package:capstone/utilities/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import '../API_Services/api_constant.dart';
import '../API_Services/data_models.dart';
import '../widget/app_texts.dart';
import '../widget/colors.dart';
import 'product_views/jewelry_page.dart';
import 'product_views/single_product_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key, required this.currentUserId}) : super(key: key);
  final String currentUserId;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late TextEditingController searchTec;
  StreamController? _exclusiveOfferController;
  StreamController? _electronics;
  StreamController? _jewelry;
  late List<ProductModel> productModel = [];
  late List<ProductModel> searchProductList = [];

  @override
  void initState() {
    searchTec = TextEditingController();
    _exclusiveOfferController = StreamController();
    _electronics = StreamController();
    _jewelry = StreamController();

    loadExclusiveOffer();
    loadElectronics();
    loadJewelry();

    super.initState();
  }

  @override
  void dispose() {
    searchTec.dispose();

    super.dispose();
  }

  Future fetchExclusiveOffer([howMany = 5]) async {
    var url = Uri.parse(ApiConstants.productLimitBaseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future fetchElectronics([howMany = 5]) async {
    var url = Uri.parse(ApiConstants.electronicsBaseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future fetchJewelry([howMany = 5]) async {
    var url = Uri.parse(ApiConstants.jewelryBaseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  loadExclusiveOffer() async {
    fetchExclusiveOffer().then((res) async {
      _exclusiveOfferController!.add(res);
      return res;
    });
  }

  loadElectronics() async {
    fetchElectronics().then((res) async {
      _electronics!.add(res);
      return res;
    });
  }

  loadJewelry() async {
    fetchJewelry().then((res) async {
      _jewelry!.add(res);
      return res;
    });
  }

  searchProducts(String? search) {
    List<ProductModel> searchList = [];
    searchList.addAll(searchProductList);
    if (search!.isNotEmpty) {
      List<ProductModel> searchResults = [];
      for (var item in searchList) {
        if (item.title!.toLowerCase().contains(search.toLowerCase())) {
          searchResults.add(item);
        }
      }
      setState(() {
        productModel = searchResults;
      });

      return;
    } else {
      productModel = searchProductList;
    }
  }

  Widget exclusiveOffer(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "USD");
    var name = format.currencySymbol;
    return StreamBuilder(
        stream: _exclusiveOfferController!.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          List<dynamic> model = snapshot.data;
          return SizedBox(
            height: 250,
            child: ListView(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              scrollDirection: Axis.horizontal,
              children: List.generate(snapshot.data.length, (index) {
                var post = model[index];
                return Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateToRoute(
                            context,
                            ProductDetailsPage(
                              productModel: post,
                              currentUserId: widget.currentUserId,
                            ));
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("${post["image"]}"),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 4, left: 8, bottom: 0, top: 10),
                              child: RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                strutStyle:
                                    StrutStyle(fontSize: Adaptive.sp(16)),
                                text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    text: "${post["title"]}"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 4, left: 8, bottom: 0, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                      text: "$name${post["price"]}",
                                      fontSize: Adaptive.sp(16),
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            CupertinoIcons.add,
                                            size: 20,
                                            color: AppColors.white,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                  ],
                );
              }),
            ),
          );
        });
  }

  Widget electronics(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "USD");
    var name = format.currencySymbol;
    return StreamBuilder(
        stream: _electronics!.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading');
          }
          List<dynamic> model = snapshot.data;
          return SizedBox(
            height: 250,
            child: ListView(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) {
                var post = model[index];
                return Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateToRoute(
                            context,
                            ProductDetailsPage(
                              productModel: post,
                              currentUserId: widget.currentUserId,
                            ));
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("${post["image"]}"),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 4, left: 8, bottom: 0, top: 10),
                              child: RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                strutStyle:
                                    StrutStyle(fontSize: Adaptive.sp(16)),
                                text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    text: "${post["title"]}"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 4, left: 8, bottom: 0, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                      text: "$name${post["price"]}",
                                      fontSize: Adaptive.sp(16),
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            CupertinoIcons.add,
                                            size: 20,
                                            color: AppColors.white,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                  ],
                );
              }),
            ),
          );
        });
  }

  Widget jewelry(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "USD");
    var name = format.currencySymbol;
    return StreamBuilder(
        stream: _jewelry!.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading');
          }
          List<dynamic> model = snapshot.data;
          return SizedBox(
            height: 250,
            child: ListView(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              scrollDirection: Axis.horizontal,
              children: List.generate(snapshot.data.length, (index) {
                var post = model[index];
                return Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateToRoute(
                            context,
                            ProductDetailsPage(
                              productModel: post,
                              currentUserId: widget.currentUserId,
                            ));
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("${post["image"]}"),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 4, left: 8, bottom: 0, top: 10),
                              child: RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                strutStyle:
                                    StrutStyle(fontSize: Adaptive.sp(16)),
                                text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    text: "${post["title"]}"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 4, left: 8, bottom: 0, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                      text: "$name${post["price"]}",
                                      fontSize: Adaptive.sp(16),
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            CupertinoIcons.add,
                                            size: 20,
                                            color: AppColors.white,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                  ],
                );
              }),
            ),
          );
        });
  }

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
        child: Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),

                    //Form Field for search bar....
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: searchTec,
                        onChanged: (String? value) {
                          // searchProduct(value!);
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.black12,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          prefixIcon: Icon(CupertinoIcons.search),
                          hintText: "Search Store",
                          helperStyle: TextStyle(fontFamily: "Gilroy"),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //Advert with Linear Gradient....
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF6EFE9), Color(0xFFFACCCC)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [0.2, 1.0],
                          tileMode: TileMode.repeated,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/flower.png",
                            width: 40,
                          ),
                          Image.asset("assets/images/fruits.png"),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                  padding:
                                      EdgeInsets.only(right: 100, left: 80)),
                              AppText(
                                  text: "Fresh Vegetables",
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                              AppText(
                                  text: "Get Up To 40% OFF",
                                  fontSize: Adaptive.sp(16),
                                  color: const Color(0xff53B175),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/images/leaf.png",
                                width: 35,
                              ),
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
                        AppText(
                            text: "Exclusive Offer",
                            fontSize: Adaptive.sp(18),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),

                        const SizedBox(
                          width: 120,
                        ),

                        //See all Button to show all items in Exclusive offer....

                        SizedBox(
                          height: 50,
                          width: 80,
                          child: CupertinoButton(
                              child: const Text(
                                "See all",
                                style: TextStyle(
                                  fontFamily: "Gilroy-Light",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color(0xff53B175),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                navigateToRoute(
                                    context,
                                    ExclusiveOfferPage(
                                        currentUserId: widget.currentUserId));
                              }),
                        ),
                      ],
                    ),

                    //1st List item - Container containing products...
                    exclusiveOffer(context),

                    //Best Selling Category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(padding: EdgeInsets.all(3)),
                        AppText(
                            text: "Electronics",
                            fontSize: Adaptive.sp(18),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                        const SizedBox(
                          width: 160,
                        ),

                        //See all Button to show all items in Best Selling Categories....
                        SizedBox(
                          height: 50,
                          width: 80,
                          child: CupertinoButton(
                              child: const Text(
                                "See all",
                                style: TextStyle(
                                  fontFamily: "Gilroy-Light",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color(0xff53B175),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                navigateToRoute(
                                    context,
                                    ELectronicsPage(
                                        currentUserId: widget.currentUserId));
                              }),
                        ),
                      ],
                    ),

                    //2nd List item - Container containing products...
                    electronics(context),
                    const SizedBox(
                      height: 10,
                    ),
                    //Jewelry Category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(padding: EdgeInsets.all(3)),
                        AppText(
                            text: "Jewelry",
                            fontSize: Adaptive.sp(18),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                        const SizedBox(
                          width: 160,
                        ),

                        //See all Button to show all items in Jewelry Categories....
                        SizedBox(
                          height: 50,
                          width: 80,
                          child: CupertinoButton(
                              child: const Text(
                                "See all",
                                style: TextStyle(
                                  fontFamily: "Gilroy-Light",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  color: Color(0xff53B175),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                navigateToRoute(
                                    context,
                                    JewelryPage(
                                        currentUserId: widget.currentUserId));
                              }),
                        ),
                      ],
                    ),

                    //2nd List item - Container containing products...
                    jewelry(context),
                    const SizedBox(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
