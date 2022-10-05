// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Text AppText({
  required String text,
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextAlign? textAlign,
}) {
  return Text(text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? Colors.black,
        fontFamily: "Gilroy",
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
      ));
}
