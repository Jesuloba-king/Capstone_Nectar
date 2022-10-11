import 'package:capstone/API_Services/models/user_model.dart';
import 'package:capstone/widget/colors.dart';
import 'package:flutter/material.dart';
import '../../../utilities/helper_functions.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.cart, required this.currentUserId})
      : super(key: key);

  final UseCartModel cart;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        // height: 100,
        width: 88,
        child: AspectRatio(
          aspectRatio: 0.88,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(cart.image.toString()),
          ),
        ),
      ),
      title: Text(
        cart.title.toString(),
        style: const TextStyle(color: Colors.black, fontSize: 16),
        maxLines: 2,
      ),
      subtitle: Text.rich(
        TextSpan(
          text: "\$${cart.price}",
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.primary),
          children: [
            TextSpan(text: " x", style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
      // trailing: Text(
      //   "\$${cart.price}",
      //   style: const TextStyle(color: Colors.black, fontSize: 16),
      // ),
    );
  }
}
