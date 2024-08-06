import 'package:flutter/material.dart';

class ConfirmBtn extends StatelessWidget {
  final VoidCallback onPressed;

  const ConfirmBtn({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, // Removes default padding
        backgroundColor: Colors.transparent, // Makes button background transparent
        shadowColor: Colors.transparent, // Removes shadow
      ),
      onPressed: onPressed,
      child: SizedBox(
        child: Image.asset(
          width: 180,
          "assets/images/ConfirmBtn.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
