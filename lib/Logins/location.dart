import 'package:capstone/Logins/log_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_location_picker/open_location_picker.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  get formKey => null;

  get zone => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(onPressed: () {Navigator.pop(context);},
          child: const Icon(CupertinoIcons.arrow_left, color: Colors.black87,),),
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Image.asset("assets/images/map.png",),
            const SizedBox(height: 40,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Select Your Location",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26, color: Colors.black, fontFamily: "Gilroy",
                        fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                    ),),
                  const SizedBox(height: 15,),

                  const Text("Switch on your location to stay in tune with \n what’s happening in your area",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Color(0xff7C7C7C), fontFamily: "Gilroy-Light",
                        fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                    ),
                  ),

                  const SizedBox(height: 20,),

                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Row(
                            children: const [
                              Text("Your Zone",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff7C7C7C), fontFamily: "Gilroy-Light",
                                    fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: zone,
                            decoration: const InputDecoration(
                                hintText: "Type your Zone"
                            ),
                          ),

                          const SizedBox(height: 30,),
                          Row(
                            children: const [
                              Text("Your Area",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff7C7C7C), fontFamily: "Gilroy-Light",
                                    fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: zone,
                            decoration: const InputDecoration(
                                hintText: "Types of your area",
                              helperStyle: TextStyle(
                                fontFamily: "Gilroy",
                              ),
                            ),
                          ),

                          SizedBox(height: 60,),
                          //continue with Submit button
                          CupertinoButton(
                              color: const Color(0xff53B175),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Submit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white, fontFamily: "Gilroy",
                                        fontStyle: FontStyle.normal, fontWeight: FontWeight.w600
                                    ),),
                                ],
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return LoginPage();}));
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
