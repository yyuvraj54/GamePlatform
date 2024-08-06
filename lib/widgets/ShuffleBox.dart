import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'buttons/ShuffleBtn.dart';

class ShuffleBox extends StatelessWidget {
  final VoidCallback onShufflePressed;

  const ShuffleBox({Key? key, required this.onShufflePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0), // Add padding for better spacing
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white38, width: 1.5), // Border color and width
        borderRadius: BorderRadius.circular(0.0), // Curve the corners
      ),
      child: Row(
        children: [
          // Image
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/shuffle.png',
              fit: BoxFit.scaleDown,

            ),
          ),

          // Text
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "SHUFFLE THE MATCHES",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
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
                          fontSize: 6,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "4m ago ",
                        style: TextStyle(
                          fontFamily: "poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 6,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Shuffle Btn
          Expanded(
            flex: 3,
            child: Container(
              child: Align(
                alignment: Alignment.centerRight,
                child: Shufflebtn(onPressed: onShufflePressed),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
