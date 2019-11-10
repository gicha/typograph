import 'package:flutter/material.dart';

TextStyle ITTextStyle({
  String fontFamily = "Montserrat",
  double fontSize,
  FontWeight fontWeight,
  Color color,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
