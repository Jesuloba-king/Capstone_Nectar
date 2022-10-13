// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../widget/app_texts.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
    required this.currentUserId,
  }) : super(key: key);
  final String currentUserId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        currentUserId: currentUserId,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          AppText(
              text: "Your Cart",
              fontSize: Adaptive.sp(18),
              color: Colors.red,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}
