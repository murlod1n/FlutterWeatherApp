import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../config/app_router.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      context.router.replace(const HomeRoute());
    });
    return Scaffold(
      body: Container(
        margin: MediaQuery.of(context).padding,
        color: const Color(0xFF2C2C33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 164.0,
                height: 164.0,
                child: Image.asset('assets/images/rain.png')),
            Container(height: 26),
            const Text(
              "Weather App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                  fontSize: 34),
            )
          ],
        ),
      ),
    );
  }
}
