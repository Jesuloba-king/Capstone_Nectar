import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/map.png",),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Select Your Location",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26, color: Colors.black, fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                    ),),
                  SizedBox(height: 30,),

                  Text("Switch on your location to stay in tune with \n what’s happening in your area",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Color(0xff7C7C7C), fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                    ),),

                  SizedBox(height: 20,),
                  //continue with next button
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
