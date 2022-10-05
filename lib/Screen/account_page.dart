import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.currentUserId}) : super(key: key);
  final String currentUserId;

  @override
  State<AccountPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<AccountPage> {
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
      ),
    );
  }
}
