import 'package:capstone/API_Services/models/service/cart_service.dart';
import 'package:capstone/widget/app_buttons.dart';
import 'package:capstone/widget/app_texts.dart';
import 'package:capstone/widget/colors.dart';
import 'package:capstone/widget/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../utilities/helper_functions.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
    required this.currentUserId,
    required this.email,
    required this.amountTotal,
  }) : super(
          key: key,
        );
  final String currentUserId;
  final String email;
  final int amountTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      onPressed: () async {
                        // await payWithCard();
                        CartModelService().chargeCard(
                            amount: amountTotal, context: context, email: '');
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
    );
  }
}
