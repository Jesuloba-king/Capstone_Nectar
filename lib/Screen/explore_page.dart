import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({Key? key, required this.currentUserId}) : super(key: key);
  final String currentUserId;

  @override
  State<ExplorerPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ExplorerPage> {
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
                height: 30,
              ),
              //Form Field for search bar....
              TextFormField(
                controller: searchTec,
                onChanged: (String? value) {
                  // searchProduct(value!);
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  prefixIcon: Icon(CupertinoIcons.search),
                  hintText: "Search Store",
                  helperStyle: TextStyle(fontFamily: "Gilroy"),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
