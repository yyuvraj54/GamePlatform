import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Shufflebtn extends StatelessWidget {
  final VoidCallback onPressed; // Define a callback function

  const Shufflebtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed, // Use the passed callback
      child: AutoSizeText(
        maxLines: 1,
        "SHUFFLE",
        style: TextStyle(
          fontFamily: "poppins",
          fontWeight: FontWeight.bold,
          fontSize: 8,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Text color
        backgroundColor: Color(0xFFD51933), // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.white, width: 1.0), // White border
        ),
      ),
    );
  }
}
