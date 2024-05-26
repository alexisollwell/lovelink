import 'package:flutter/material.dart';

class LoveButton extends StatelessWidget {
  final String texto;
  final double Wsize;
  final Color? ButtonColor;
  final Color? BorderColor;

  const LoveButton({super.key, required this.texto, required this.Wsize,this.ButtonColor,this.BorderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  40,
      width: Wsize,
      decoration: BoxDecoration(
        color: ButtonColor ?? const Color(0xFFFFCB74),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: BorderColor ?? const Color(0xFFC49C59)
        )
      ),
      child: Center(
        child: Text(
          texto,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            fontFamily: 'Monse'
          ),
        ),
      ),
    );
  }
}
