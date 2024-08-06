import 'package:flutter/material.dart';

class AddPlayerBtn extends StatelessWidget {
  final VoidCallback onPressed; // Define a callback function

  const AddPlayerBtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Use the passed callback
      child: Icon(
        Icons.add, // Plus icon
        size: 23,
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Icon color
        backgroundColor: Color(0xFFD51933), // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Square button
        ),
        minimumSize: Size(0, 70), // Square size
      ),
    );
  }
}
