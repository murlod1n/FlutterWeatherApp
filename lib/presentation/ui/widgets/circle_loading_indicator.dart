import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget CircleLoadingIndicator() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 128,
        width: 128,
        child: LoadingIndicator(
            indicatorType: Indicator.ballClipRotate, /// Required, The loading type of the widget
            colors: [Colors.white],       /// Optional, The color collections
            strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
            backgroundColor: Colors.transparent,      /// Optional, Background of the widget
            pathBackgroundColor: Colors.transparent   /// Optional, the stroke backgroundColor
        ),
      )
    ],
  );
}
