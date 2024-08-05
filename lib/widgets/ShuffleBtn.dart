import 'package:flutter/material.dart';

class Shufflebtn extends StatelessWidget {
  final VoidCallback onPressed; // Define a callback function

  const Shufflebtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Use the passed callback
      child: Text(
        "SHUFFLE",
        style: TextStyle(
          fontFamily: "poppins",
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Text color
        backgroundColor: Colors.red, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.white, width: 1.0), // White border
        ),
      ),
    );
  }
}
