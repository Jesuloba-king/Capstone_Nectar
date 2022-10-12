// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api
import 'package:animated_shimmer/animated_shimmer.dart';
import 'package:capstone/API_Services/models/service/cart_service.dart';
import 'package:capstone/API_Services/models/user_model.dart';
import 'package:capstone/Screen/cart/components/payment_page.dart';
import 'package:capstone/widget/app_buttons.dart';
import 'package:capstone/widget/app_texts.dart';
import 'package:capstone/widget/colors.dart';
import 'package:capstone/widget/spacer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:capstone/utilities/helper_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.currentUserId,
  }) : super(key: key);
  final String currentUserId;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CartModelService service = CartModelService();
  late Future<List<UseCartModel>> cartList;
  late List<UseCartModel> retrieveCartList = [];
  static final _auth = FirebaseAuth.instance;
  String selectedCurrency = "";

  bool isTestMode = true;
  final pbk = "FLWPUBK_TEST";

  dynamic amountTotal = 0;
  String totalAmount = "";
  int payTotal = 0;

  @override
  void initState() {
    super.initState();
    //initialize the publicKey
    _initRetrieval();
    // _intTotal();
  }

  Future<void> _initRetrieval() async {
    cartList = service.retrieveCart(widget.currentUserId);
    //retrieveCartList
    final data = await service.retrieveCart(widget.currentUserId);
    setState(() {
      retrieveCartList = data;
      amountTotal = retrieveCartList
          .map<dynamic>((e) => e.price)
          .reduce((a, b) => a + b)
          .toString();
      // payTotal = int.parse(amountTotal);
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser!;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.spacerH20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: getProportionateScreenWidth(40),
                      width: getProportionateScreenWidth(40),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset("assets/images/receipt.svg"),
                    ),
                    const Spacer(),
                    const Text("Add voucher code"),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Space.spacerH50,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            text: "\$$amountTotal",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 190,
                      child: appButton(
                        onPressed: () {
                          navigateToRoute(
                              context,
                              PaymentPage(
                                  amount: amountTotal,
                                  email: user.email!,
                                  name: ""));
                        },
                        btnColor: AppColors.primary,
                        child: AppText(
                            text: "Check Out",
                            fontSize: Adaptive.sp(18),
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Space.spacerH50,
            ],
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder(
            future: cartList,
            builder: (context, AsyncSnapshot<List<UseCartModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const AnimatedShimmer(
                    height: 220,
                    width: double.infinity,
                    startColor: Colors.grey,
                    endColor: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    delayInMilliSeconds: Duration(milliseconds: 500),
                  ),
                );
              }
              if (snapshot.data.toString().isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                          text:
                              "No Item in Your Cart\n Items will appear as soon as you add them",
                          fontSize: Adaptive.sp(18),
                          color: Colors.red,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: retrieveCartList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(retrieveCartList[index].id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        retrieveCartList.removeAt(index);
                      });
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset("assets/images/Trash.svg"),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CartCard(
                                  cart: retrieveCartList[index],
                                  currentUserId: widget.currentUserId,
                                ),
                              ),
                              //  const Spacer(),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    retrieveCartList.removeAt(index);
                                  });
                                  CartModelService().deleteCart(
                                    retrieveCartList[index].postId.toString(),
                                    widget.currentUserId,
                                  );
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
