import 'package:flutter/material.dart';
import 'package:task/widgets/buttons/CancelBtn.dart';
import 'package:task/widgets/buttons/ConfirmBtn.dart';

void showAddPlayerDialog(BuildContext context, Function(String, String) onConfirm) {
  final playerNameController = TextEditingController();
  final gamerIdController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      final mediaQuery = MediaQuery.of(context);
      final screenWidth = mediaQuery.size.width;
      final screenHeight = mediaQuery.size.height;

      return Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/popup.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter New Player Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6, // 60% of the parent width
                            child: TextField(
                              controller: playerNameController,
                              decoration: InputDecoration(
                                labelText: 'Enter Player Name',
                                labelStyle: TextStyle(
                                  color: Colors.grey.shade200,
                                ),
                                filled: true,
                                fillColor: Color(0xFF2E2E2E),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400, // Gray shiny border color
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              maxLength: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6, // 60% of the parent width
                            child: TextField(
                              controller: gamerIdController,
                              decoration: InputDecoration(
                                labelText: 'Enter Player Gamer ID',
                                labelStyle: TextStyle(
                                  color: Colors.grey.shade200,
                                ),
                                filled: true,
                                fillColor: Color(0xFF7B2727),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade400, // Gray shiny border color
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              maxLength: 16,
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(child: Text("Cancel"),onPressed:() {Navigator.of(context).pop();}
                            ),
                            ElevatedButton(child: Text("Confirm"),onPressed: () {onConfirm(playerNameController.text, gamerIdController.text,);
                              Navigator.of(context).pop();},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
