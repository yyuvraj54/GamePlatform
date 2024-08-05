import 'package:flutter/material.dart';

void showAddPlayerDialog(BuildContext context, Function(String, String) onConfirm) {
  final playerNameController = TextEditingController();
  final gamerIdController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
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
                  SizedBox(height: 20),
                  Text(
                    'Enter New Player Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: playerNameController,
                          decoration: InputDecoration(
                            labelText: 'Enter Player Name',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(),
                          ),
                          maxLength: 16,
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: gamerIdController,
                          decoration: InputDecoration(
                            labelText: 'Enter Player Gamer ID',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(),
                          ),
                          maxLength: 16,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                onConfirm(
                                  playerNameController.text,
                                  gamerIdController.text,
                                );
                                Navigator.of(context).pop();
                              },
                              child: Text('Confirm'),
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
