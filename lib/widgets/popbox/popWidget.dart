import 'package:flutter/material.dart';

void showAddPlayerDialog(BuildContext context, Function(String, String) onConfirm) {
  final playerNameController = TextEditingController();
  final gamerIdController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return Container(
              height: 300,
              child: Stack(
                children: [
                  Positioned.fill(

                    child: Image.asset(
                      'assets/images/popup.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Add Players',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
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
                                  color: Colors.grey.shade400,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            maxLength: 16,
                          ),
                          TextField(
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
                                  color: Colors.grey.shade400,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            maxLength: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero, // Removes default padding
                                  backgroundColor: Colors.transparent, // Makes button background transparent
                                  shadowColor: Colors.transparent, // Removes shadow
                                ),
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero, // Removes default padding
                                  backgroundColor: Colors.transparent, // Makes button background transparent
                                  shadowColor: Colors.transparent, // Removes shadow
                                ),
                                child: Text("Confirm"),
                                onPressed: () {
                                  onConfirm(playerNameController.text, gamerIdController.text);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
