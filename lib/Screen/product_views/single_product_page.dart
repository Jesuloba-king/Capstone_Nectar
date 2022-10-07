import 'dart:async';
import 'dart:convert';

import 'package:capstone/widget/app_texts.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import '../../API_Services/api_constant.dart';
import '../../API_Services/data_models.dart';
import '../../utilities/helper_functions.dart';
import '../../widget/app_buttons.dart';
import '../../widget/colors.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage(
      {super.key, required this.productModel, required this.currentUserId});
  final Map<String, dynamic> productModel;
  final String currentUserId;

  @override
  State<ProductDetailsPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductDetailsPage> {
  StreamController? _category;

  @override
  void initState() {
    _category = StreamController();

    loadCategory();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future fetchCategory([howMany = 5]) async {
    var url = Uri.parse(
        ApiConstants.productCategoryBaseUrl + widget.productModel['category']);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  loadCategory() async {
    fetchCategory().then((res) async {
      _category!.add(res);
      return res;
    });
  }

  ProductModel productModel = ProductModel();
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "USD");
    var name = format.currencySymbol;
    productModel = ProductModel.fromJson(widget.productModel);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: AppText(
            text: "Product Details",
            fontSize: Adaptive.sp(18),
            color: Colors.red,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.only(left: 10,right: 10,top: 20,),
        child: ListView(
          children: [
            Container(
              // width: 110,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${productModel.image}")),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      right: 10, left: 10, bottom: 0, top: 10),
                  child: AppText(
                      text: "$name${productModel.price}",
                      fontSize: Adaptive.sp(18),
                      color: Colors.red,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: [
                          AppText(
                              text: "${productModel.rating!.rate}",
                              fontSize: Adaptive.sp(16),
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600),
                          const SizedBox(
                            width: 5,
                          ),
                          RatingBar.builder(
                            initialRating: 0.0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: (productModel.rating!.rate).toInt(),
                            itemSize: 20,
                            glowColor: Colors.red,
                            unratedColor: Colors.red,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 15,
                            ),
                            onRatingUpdate: (rating) {
                              if (kDebugMode) {
                                print(rating);
                              }
                            },
                          ),
                          // Row(
                          //   children: List.generate(
                          //     5,
                          //     (index) => const Icon(
                          //       Icons.star_border,
                          //       size: 12.0,
                          //       color: Colors.red,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.all(0),
                        child: Icon(
                          Icons.star_border,
                          size: 30.0,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10, left: 10, bottom: 0, top: 10),
                  child: AppText(
                      text: "${productModel.title}",
                      fontSize: Adaptive.sp(18),
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: AppText(
                            text: "Category: ${productModel.category}",
                            fontSize: Adaptive.sp(15),
                            color: Colors.red,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: AppText(
                            text: "Brand:",
                            fontSize: Adaptive.sp(15),
                            color: Colors.red,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                ExpandableNotifier(
                    child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        ScrollOnExpand(
                          scrollOnExpand: true,
                          scrollOnCollapse: false,
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToCollapse: true,
                            ),
                            header: Padding(
                              padding: const EdgeInsets.all(10),
                              child: AppText(
                                  text: "Descriptions",
                                  fontSize: Adaptive.sp(20),
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                            collapsed: Text(
                              "${productModel.description}",
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                for (var _ in Iterable.generate(1))
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: AppText(
                                        text: "${productModel.description}",
                                        fontSize: Adaptive.sp(18),
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal),
                                  ),
                              ],
                            ),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Expandable(
                                  collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      appButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                                text: "Add to Cart",
                                fontSize: Adaptive.sp(16),
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
                StreamBuilder(
                  stream: _category!.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    debugPrint('Has error: ${snapshot.hasError}');
                    debugPrint('Has data: ${snapshot.hasData}');
                    debugPrint('Snapshot Data ${snapshot.data}');

                    if (snapshot.hasError) {
                      return const Text("error");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    List<dynamic> model = snapshot.data;
                    return IntrinsicGridView.vertical(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 0, left: 0, right: 0),
                      verticalSpace: 5,
                      horizontalSpace: 5,
                      children: List.generate(
                        snapshot.data.length,
                        (index) {
                          var post = model[index];
                          return GestureDetector(
                            onTap: () {
                              navigateToRoute(
                                  context,
                                  ProductDetailsPage(
                                    productModel: post,
                                    currentUserId: widget.currentUserId,
                                  ));
                            },
                            child: Container(
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
                                          image:
                                              NetworkImage("${post["image"]}"),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
