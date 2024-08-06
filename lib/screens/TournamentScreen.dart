// lib/screens/tournament_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/tournament_bloc.dart';
import '../bloc/tournament_event.dart';
import '../bloc/tournament_state.dart';
import '../Models/player.dart';
import '../Models/round.dart';
import '../repositories/tournament_repository.dart';
import '../widgets/buttons/AddPlayerButton.dart';
import '../widgets/MatchWidget.dart';
import '../widgets/ShuffleBox.dart';
import '../widgets/TopBar.dart';
import '../widgets/popbox/popWidget.dart';

class TournamentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TopBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShuffleBox(onShufflePressed: () {}),
              AddPlayerBtn(onPressed: () {
                showAddPlayerDialog(context, (name, gamerId) {
                  BlocProvider.of<TournamentBloc>(context).add(
                    AddPlayerEvent(
                      Player(
                        id: gamerId,
                        name: name,
                        image: 'assets/images/player.png',
                        score: Random().nextInt(101),
                      ),
                    ),
                  );
                });
              }),
            ],
          ),
          Expanded(
            child: BlocBuilder<TournamentBloc, TournamentState>(
              builder: (context, state) {
                if (state is TournamentUpdated) {
                  return PageView.builder(
                    itemCount: state.rounds.length,
                    itemBuilder: (context, index) {
                      Round round = state.rounds[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: round.matches.length,
                          itemBuilder: (context, matchIndex) {
                            return MatchWidget(match: round.matches[matchIndex]);
                          },
                        ),
                      );
                    },
                  );
                } else if (state is TournamentInitial) {
                  return Center(child: Text(state.message.toString()));
                }
                return Center(child: Text("Error"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
