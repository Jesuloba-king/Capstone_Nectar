import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key, required this.currentUserId}) : super(key: key);
  final String currentUserId;

  @override
  State<FavoritePage> createState() => _ShopPageState();
}

class _ShopPageState extends State<FavoritePage> {
  late TextEditingController searchTec;

  @override
  void initState() {
    searchTec = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    searchTec.dispose();

    super.dispose();
  }

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Find Products",
                style: TextStyle(
                  fontFamily: "Gilroy-ExtraBold",
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(CupertinoIcons.location_solid),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Favorite Page",
                style: TextStyle(fontSize: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
