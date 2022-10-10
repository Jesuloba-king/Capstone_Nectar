// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key, required Center child}) : super(key: key);
  get searchTec => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: GridView.extent(
                  physics: const BouncingScrollPhysics(),
                  maxCrossAxisExtent: 200.0,
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: const Color(0xff53b175b2),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text('Fresh Fruits & Vegetable',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Gilroy",
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: const Color(0xfff8a44cb2).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text('Cooking Oil & Ghee',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Gilroy",
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: const Color(0xffff7a593).withOpacity(0.25),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text('Meat & Fish',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Gilroy",
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: const Color(0xfffd3b0e0).withOpacity(0.75),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text('Bakery & Snacks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Gilroy",
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: const Color(0xffffde598).withOpacity(0.65),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text('Dairy & Eggs',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Gilroy",
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: const Color(0xffF7DFF5).withOpacity(0.95),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text(
                        'Beverages',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Gilroy",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
