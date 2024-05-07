import 'package:flutter/material.dart';

Widget standardButton(context, IconData icon, String textValue) {
  return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 3,
      children: [Icon(icon, size: 18), Text(textValue, style: const TextStyle(fontFamily: "Raleway"))]);
}
