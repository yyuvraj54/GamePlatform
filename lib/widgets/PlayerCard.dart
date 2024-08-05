import 'package:flutter/material.dart';
import '../Models/player.dart';

class Playercard extends StatelessWidget {
  final Player player;

  const Playercard({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth * 0.7; // Adjust width as needed

        return Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: cardWidth,
                  padding: EdgeInsets.only(left: 50.0), // Adjust padding to accommodate the image
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white38, width: 1.5),
                    borderRadius: BorderRadius.circular(0.0),
                    color: Colors.grey[800],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 40.0), // Space for the overlapping image
                      // Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              player.name,
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis, // Handles long names
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "GT ID ${player.id}",
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.green,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Score
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text(
                            player.score.toString(),
                            style: TextStyle(
                              fontFamily: "poppins",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: -40.0, // Adjust this value to control the overlap
                  child: Image.asset(
                    alignment: Alignment.center,
                    "assets/images/player.png",
                    fit: BoxFit.fill,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
