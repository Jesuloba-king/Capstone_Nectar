// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:animated_shimmer/animated_shimmer.dart';
import 'package:capstone/API_Services/models/service/cart_service.dart';
import 'package:capstone/API_Services/models/user_model.dart';
import 'package:capstone/widget/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:capstone/utilities/helper_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../API_Services/models/cart.dart';
import '../../../widget/colors.dart';
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

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    cartList = service.retrieveCart(widget.currentUserId);
    retrieveCartList = await service.retrieveCart(widget.currentUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
