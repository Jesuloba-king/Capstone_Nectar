// ignore_for_file: library_private_types_in_public_api

import 'package:capstone/widget/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoriteProductPage extends StatefulWidget {
  const FavoriteProductPage({Key? key, required this.currentUserId})
      : super(key: key);
  final String currentUserId;
  @override
  _ABusinessSaveListPageState createState() => _ABusinessSaveListPageState();
}

class _ABusinessSaveListPageState extends State<FavoriteProductPage> {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    List<String> productImage = [
      "https://cdn.vox-cdn.com/thumbor/YFnb9mlx_bEgPzQHjvvLAY0QRc0=/0x0:2040x1360/920x613/filters:focal(877x866:1203x1192):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/66397697/akrales_181019_3014_0770.0.jpg",
      "https://www.techadvisor.com/cmsdata/slideshow/3627209/redmi_note_10_pro_review_1_thumb800.jpg",
      "https://cf.ltkcdn.net/jewelry/images/std/273031-800x533-jewelry-101-masterclass-accessories.webp",
      "https://assets.vogue.com/photos/6112cb6b8598bb8c5f827577/1:1/w_1600%2Cc_limit/slide_8.jpg",
      "https://assets.vogue.com/photos/60ae5b3fee392eb927daae53/1:1/w_1600%2Cc_limit/slide_12.jpg",
      "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F14%2F2022%2F04%2F18%2FGettyImages-1391051737-2000.jpg&w=426&h=285&q=60&c=tc&rect=0%2C0%2C2000%2C1333",
      "https://icdn.digitaltrends.com/image/digitaltrends/dell-xps-15-oled-2021-laptop-720x720.jpg",
      "https://icdn.digitaltrends.com/image/digitaltrends/macbook-pro-2021-16-720x720.jpg",
      "https://icdn.digitaltrends.com/image/digitaltrends/new-chromebook-2-featured-resized-720x720.jpg",
      "https://icdn.digitaltrends.com/image/digitaltrends/razer-blade-base-model-29949-720x720.jpg",
      "https://cdn.pocket-lint.com/r/s/970x/assets/images/157226-laptops-review-microsoft-surface-laptop-4-review-image1-shvxgffygd-jpg.webp",
      "https://www.cnet.com/a/img/resize/385e412d72fdcb64523ee2d1e15412a566887dbf/2021/05/13/d4445988-4e84-4652-abc5-dfc2924395fd/edifier-r1280db-2-3.png?auto=webp&fit=crop&height=425&width=756"
    ];
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: AppText(
                text: "Saved Product",
                fontSize: Adaptive.sp(18),
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
            child: ListView(
                padding: const EdgeInsets.only(right: 0, left: 0, top: 0),
                children: <Widget>[
                  const Divider(),
                  Column(
                    children: List.generate(
                        productImage.length,
                        (index) => InkWell(
                            onTap: () {},
                            child: Card(
                                clipBehavior: Clip.hardEdge,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 15),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Container(
                                            height: 120,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      productImage[index]),
                                                )),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            AppText(
                                                text:
                                                    "32' Inch Smart Curved TV With Netflix",
                                                fontSize: Adaptive.sp(18),
                                                color: Colors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600),
                                            AppText(
                                                text:
                                                    "${format.currencySymbol}200,000",
                                                fontSize: Adaptive.sp(18),
                                                color: Colors.red,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600),
                                            const SizedBox(height: 5),
                                          ],
                                        )),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: <Widget>[
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.white38,
                                            disabledForegroundColor:
                                                Colors.grey.withOpacity(0.38),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              AppText(
                                                  text: "Remove",
                                                  fontSize: Adaptive.sp(15),
                                                  color: Colors.red,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w600),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.white38,
                                            disabledForegroundColor:
                                                Colors.grey.withOpacity(0.38),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              const Icon(
                                                Icons.shopping_cart_sharp,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              AppText(
                                                  text: "Add to Cart",
                                                  fontSize: Adaptive.sp(15),
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w600),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )))),
                  )
                ]),
          ),
        );
      },
    );
  }
}
