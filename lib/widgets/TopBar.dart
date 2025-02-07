import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Image.asset('assets/images/topbar.png', fit: BoxFit.fitWidth, width: double.infinity, height: 150,),
        Positioned.fill(child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText("BRACKET",maxLines: 1, style: TextStyle(fontFamily: "poppins", fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white,),),
            Image.asset('assets/images/underline.png', fit: BoxFit.scaleDown, width: 100,  height: 20,),
            SizedBox(height: 40),
          ],
        ),
        ),
      ],
      ),
    );
  }
}
