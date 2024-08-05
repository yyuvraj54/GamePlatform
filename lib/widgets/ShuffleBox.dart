import 'package:flutter/material.dart';

import 'ShuffleBtn.dart';

class ShuffleBox extends StatelessWidget {
  final VoidCallback onShufflePressed;

  const ShuffleBox({Key? key, required this.onShufflePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,0,20,0),
      child: Container(
        padding: EdgeInsets.all(8.0), // Add padding for better spacing
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white38, width: 1.5), // Border color and width
          borderRadius: BorderRadius.circular(0.0), // Curve the corners
        ),
        child: Row(
          children: [
            // Image
            Image.asset(
              'assets/images/shuffle.png',
              fit: BoxFit.scaleDown,
              width: 50,
              height: 50,
            ),

            // Text
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SHUFFLE THE MATCHES",
                    style: TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Last shuffled on ",
                        style: TextStyle(
                          fontFamily: "poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "4m ago ",
                        style: TextStyle(
                          fontFamily: "poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 8,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Shuffle Btn
            Container(
              width: 220,
              child: Align(
                alignment: Alignment.centerRight,
                child: Shufflebtn(onPressed: onShufflePressed),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
