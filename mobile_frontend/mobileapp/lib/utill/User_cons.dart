import 'package:flutter/material.dart';

class UtilConstants{

  static const Color primaryColor = Color(0xff20A8D6);
  static const Color whiteColor = Colors.white;

  static Shader get gradientShader => const LinearGradient(
          colors: [primaryColor, whiteColor])
      .createShader(const Rect.fromLTWH(20.0, 200.0, 200.0, 20.0));

  static const String googleImagePath = "assets/google.png";
  static const String facebookImagePath = "assets/facebook.png";
 

}