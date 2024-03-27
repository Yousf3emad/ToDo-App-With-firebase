import 'package:flutter/material.dart';

Widget appNameWidget({required BuildContext context,required String txt}) => Text(
  txt,
  style: const TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 22.0),
);