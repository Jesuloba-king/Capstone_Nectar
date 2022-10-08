import 'dart:async';
import 'dart:convert';

import 'package:animated_shimmer/animated_shimmer.dart';
import 'package:capstone/Screen/product_views/single_product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../API_Services/api_constant.dart';
import '../../utilities/helper_functions.dart';
import '../../widget/app_texts.dart';
import '../../widget/colors.dart';

class JewelryPage extends StatefulWidget {
  const JewelryPage({super.key, required this.currentUserId});

  final String currentUserId;

  @override
  State<JewelryPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<JewelryPage> {
  StreamController? _postsController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int count = 1;

  Future fetchPost([howMany = 5]) async {
    var url = Uri.parse(ApiConstants.jewelryBaseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  loadPosts() async {
    fetchPost().then((res) async {
      _postsController!.add(res);
      return res;
    });
  }

  showSnack() {
    return ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("New Data")));
  }

  Future<void> _handleRefresh() async {
    count++;
    debugPrint(count.toString());
    fetchPost(count * 5).then((res) async {
      _postsController!.add(res);
      showSnack();
      return null;
    });
  }

  @override
  void initState() {
    _postsController = StreamController();
    loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: "USD");
    var name = format.currencySymbol;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('ELectronics'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            tooltip: 'Refresh',
            icon: const Icon(Icons.refresh),
            onPressed: _handleRefresh,
          )
        ],
      ),
      body: StreamBuilder(
        stream: _postsController!.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          debugPrint('Has error: ${snapshot.hasError}');
          debugPrint('Has data: ${snapshot.hasData}');
          debugPrint('Snapshot Data ${snapshot.data}');

          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: getScreenHeight(context),
              width: getScreenWidth(context),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: AnimatedShimmer(
                height: getScreenHeight(context),
                width: getScreenWidth(context),
                startColor: Colors.grey,
                endColor: Colors.blueGrey,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                delayInMilliSeconds: const Duration(milliseconds: 500),
              ),
            );
          }
          List<dynamic> model = snapshot.data;
          return Column(
            children: <Widget>[
              Expanded(
                  child: Scrollbar(
                child: RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: SingleChildScrollView(
                    child: IntrinsicGridView.vertical(
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
                    ),
                  ),
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
