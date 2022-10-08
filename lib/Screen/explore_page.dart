import 'package:animated_shimmer/animated_shimmer.dart';
import 'package:capstone/Screen/product_views/search_details_page.dart';
import 'package:capstone/Screen/product_views/single_product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../API_Services/api_service.dart';
import '../API_Services/data_models.dart';
import '../utilities/helper_functions.dart';
import '../widget/app_texts.dart';
import '../widget/colors.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({Key? key, required this.currentUserId}) : super(key: key);
  final String currentUserId;

  @override
  State<ExplorerPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ExplorerPage> {
  TextEditingController searchTEC = TextEditingController();
  bool isLoading = false;
  late List<ProductModel> productModel = [];
  late List<ProductModel> searchProductList = [];

  getProducts() async {
    setState(() {
      isLoading = true;
    });

    final data = await ApiService().getProducts();
    setState(() {
      productModel = data!;
      searchProductList = data;
      isLoading = false;
      if (kDebugMode) {
        print(productModel);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
    // getUserList();
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

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "USD");
    var name = format.currencySymbol;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: AppText(
                text: "Search Here",
                fontSize: Adaptive.sp(18),
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600),
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : productModel.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          //AppBar with a color gradient style....
                          children: [
                            SizedBox(
                              height: 10.h,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: TextFormField(
                                  controller: searchTEC,
                                  onChanged: (String? value) {
                                    searchProducts(value!);
                                  },
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black12,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                    ),
                                    prefixIcon: Icon(CupertinoIcons.search),
                                    hintText: "Search Store",
                                    helperStyle:
                                        TextStyle(fontFamily: "Gilroy"),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: productModel.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          onTap: () {
                                            navigateToRoute(
                                                context,
                                                DetailScreen(
                                                  id: productModel[index].id,
                                                  category: productModel[index]
                                                      .category
                                                      .toString(),
                                                  currentUserId:
                                                      widget.currentUserId,
                                                ));
                                          },
                                          title: AppText(
                                              text:
                                                  "${productModel[index].title}",
                                              fontSize: Adaptive.sp(18),
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600),
                                          leading: Image.network(
                                            productModel[index]
                                                .image
                                                .toString(),
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          subtitle: AppText(
                                              text:
                                                  "$name${productModel[index].price}",
                                              fontSize: Adaptive.sp(16),
                                              color: Colors.red,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: Text("No Product is available"),
                    )),
    );
  }
}
