import 'package:flutter/material.dart';

class Utils {
  Widget gameDisplay(String img, String text) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Container(
        decoration: BoxDecoration(color: Colors.red),
        child: Row(
          children: [Text(img), Text(text)],
        ),
      ),
    );
  }
}
