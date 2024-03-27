import 'package:flutter/material.dart';

Widget defaultText({
  required String txt,
  double fontSize = 16,
  Color? color
}) =>
    Text(
      txt,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        fontFamily: "Poppins",
        color: color,
      ),
    );
