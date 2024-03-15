import 'package:flutter/cupertino.dart';

Widget defaultText({
  required String txt,
  double fontSize = 16,
}) =>
    Text(
      txt,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        fontFamily: "Poppins",
      ),
    );
