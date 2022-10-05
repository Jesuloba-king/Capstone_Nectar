import 'package:capstone/widget/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appButton({
  required Widget child,
  required VoidCallback onPressed,
  Color? btnColor,
  BorderRadius? borderRadius,
  double? height,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
          color: btnColor ?? AppColors.primary,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        child: child),
  );
}
