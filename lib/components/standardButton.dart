import 'package:flutter/material.dart';

import '../main.dart';

Widget standardButton(context, IconData icon, String textValue) {
  return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 3,
      children: [Icon(icon, size: 18, color: colorTheme.secondary), Text(textValue, style: TextStyle(fontFamily: "Raleway", color: colorTheme.secondary))]);
}
