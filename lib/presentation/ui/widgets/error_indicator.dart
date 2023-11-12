import 'package:flutter/material.dart';

Widget ErrorIndicator() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
          width: 164.0,
          height: 164.0,
          child: Image.asset('assets/images/error.png')),
      Container(height: 26),
      const Text(
        "Something went wrong",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white60, fontSize: 34),
      )
    ],
  );
}
