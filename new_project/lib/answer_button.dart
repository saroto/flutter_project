import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnwserButton extends StatelessWidget {
  const AnwserButton(
      {super.key, required this.answerText, required this.onPressed});
  final String answerText;
  final void Function() onPressed;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
