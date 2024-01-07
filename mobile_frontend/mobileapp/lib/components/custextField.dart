import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFeild extends StatelessWidget {
  final String lable;
  final bool obscure;
  final MediaQueryData mediaQueryData;
  final ValueChanged<String>? onChanged;
  const CustomTextFeild({
    super.key,
    required this.lable,
    this.obscure = false,
    required this.mediaQueryData,
    required TextInputType keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaQueryData.size.height,
      height: mediaQueryData.size.height * 0.063,
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: lable,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.text,
        onChanged:onChanged,
      ),
    );
  }
}