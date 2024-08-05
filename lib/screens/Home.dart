import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/widgets/AddPlayerButton.dart';
import 'package:task/widgets/ShuffleBox.dart';
import 'package:task/widgets/ShuffleBtn.dart';
import 'package:task/widgets/TopBar.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import 'TournamentScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              TopBar(),
              Container(
                width: double.infinity,
                child: Column(children: [
                  Row( children: [
                    // shuffle box
                   ShuffleBox(onShufflePressed: () {  },),

                    // Add Player Btn

                    AddPlayerBtn(onPressed: (){}),

                    Container(child: TournamentScreen())
                    
                    
                    
                  ],
                  )
                ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
