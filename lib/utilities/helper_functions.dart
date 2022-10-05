import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';

String formatAmount(double? amount) {
  // if (amount! <= 0.0) {
  //   return amount.toString();
  // }
  var formatter = NumberFormat("#,##0.00", "en_US");
  return "${getNairaSymbol()}${formatter.format(amount)}";
}

String formatAmountWithoutSymbol(double? amount) {
  // if (amount! <= 0.0) {
  //   return amount.toString();
  // }
  var formatter = NumberFormat("#,##0.00", "en_US");
  return formatter.format(amount);
}

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String), width: 40, height: 40);
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Widget addSeperator(Color color, double height) {
  return Divider(color: color, height: height);
}

Widget addVerticalSpacing(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpacing(double width) {
  return SizedBox(width: width);
}

double getPercentageHeight(BuildContext context, double height) {
  var heightPercentage = (height / 100) * getScreenHeight(context);
  return heightPercentage;
}

double getPercentageWidth(BuildContext context, double width) {
  var widthPercentage = (width / 100) * getScreenWidth(context);
  return widthPercentage;
}

Widget nairaText(
    {required double? amount,
    String? precedingText = "",
    String? trailingText = "",
    TextStyle style = const TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)}) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      text: '$precedingText ${formatAmount(amount)} $trailingText',
      style: style,
    ),
  );
}

double buttonHeight = 50;

String convertToTitleCase(String? text) {
  if (text == null) {
    return "Not Assigned";
  }

  text = text.toLowerCase();

  if (text.length <= 1) {
    return text.toUpperCase();
  }

  // Split string into multiple words
  final List<String> words = text.split(' ');

  // Capitalize first letter of each words
  final capitalizedWords = words.map((word) {
    if (word.trim().isNotEmpty) {
      final String firstLetter = word.trim().substring(0, 1).toUpperCase();
      final String remainingLetters = word.trim().substring(1);

      return '$firstLetter$remainingLetters';
    }
    return '';
  });

  // Join/Merge all words back to one String
  return capitalizedWords.join(' ');
}

Widget produceButton(
    String text, Color color, double width, VoidCallback onPressed,
    [double height = 50,
    Color textColor = Colors.white,
    double fontSize = 14]) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.normal))),
  );
}

Widget produceSmallButton(
    String text, Color color, double width, VoidCallback onPressed,
    [double height = 50,
    Color textColor = Colors.white,
    double fontSize = 12]) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Center(
        child: Text(text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.normal)),
      ),
    ),
  );
}

Widget produceImage(String imgPath, double imgWidth, double imgHeight,
    [BoxFit fit = BoxFit.contain]) {
  return Image.asset(
    imgPath,
    fit: fit,
    width: imgWidth,
    height: imgHeight,
  );
}

Widget showCircularLoadingIndicator = Align(
    alignment: Alignment.center,
    child: Container(
        color: Colors.black.withOpacity(0.5),
        width: 100,
        height: 100,
        child: showAppLoader));

//non - functions
Widget showAppLoader = const Center(
  child: CircularProgressIndicator(
    strokeWidth: 10,
    color: Colors.yellowAccent,
    backgroundColor: Colors.red,
  ),
);

String getNairaSymbol() {
  return "\u{20A6}";
}

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void popSheet(BuildContext context) {
  Navigator.of(context).pop();
}

void navigateToRoute(BuildContext context, dynamic routeClass) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => routeClass));
}

void navigateAndReplaceRoute(BuildContext context, dynamic routeClass) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => routeClass));
}

void navigateAndRemoveUntilRoute(BuildContext context, dynamic routeClass) {
  Navigator.pushAndRemoveUntil(context,
      CupertinoPageRoute(builder: (context) => routeClass), (route) => false);
}

showInfoAlertWithAction(BuildContext context, String title, String description,
    Function onPressed) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        CupertinoDialogAction(
            child: const Text("Ok"),
            onPressed: () {
              Navigator.of(context).pop(true);
              onPressed();
            }),
      ],
    ),
  );
}

showCancelOrProceedAlert(
    {required BuildContext context,
    required String title,
    required String description,
    String cancel = "Cancel",
    String proceed = "Proceed",
    required VoidCallback onPressed}) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(
            cancel,
            style: const TextStyle(color: Colors.red),
          ),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(true),
        ),
        CupertinoDialogAction(
          onPressed: onPressed,
          child: Text(proceed),
        ),
      ],
    ),
  );
}

showThreeOptionsAlert({
  required BuildContext context,
  required String title,
  required String description,
  String cancel = "Cancel",
  required String titleOne,
  required String titleTwo,
  required VoidCallback onPressedOne,
  required VoidCallback onPressedTwo,
}) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: onPressedOne,
          child: Text(titleOne),
        ),
        CupertinoDialogAction(
          onPressed: onPressedTwo,
          child: Text(titleTwo),
        ),
        CupertinoDialogAction(
          child: Text(
            cancel,
            style: const TextStyle(color: Colors.red),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}

displayBottomSheet(context, Widget bottomSheet) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: GestureDetector(onTap: dismissKeyboard, child: bottomSheet)));
}
