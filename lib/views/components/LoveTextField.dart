import 'package:flutter/material.dart';

class LoveTextField extends StatelessWidget {
  final String Placeholder;
  final double Wsize;
  final bool? isObscured;
  final Widget? icono;
  final Color? textColor;
  final TextEditingController? controller;

  const LoveTextField({
    super.key,
    required this.Placeholder,
    this.isObscured,
    this.icono,
    required this.Wsize,
    this.controller,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Wsize,
      child: TextField(
        controller: controller,
        obscureText: isObscured ?? false,
        decoration:  InputDecoration(
          prefixIcon:  icono ?? Icon(null),
          border: OutlineInputBorder(),
          labelText: Placeholder,
        ),
        style: TextStyle(color: textColor??Colors.black),
      ),
    );
  }
}
