import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/widgets/PlayerCard.dart';

import '../Models/round.dart';
import '../Models/match.dart';

class RoundWidget extends StatelessWidget {
  final Round round;

  RoundWidget({required this.round});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Round ${round.roundNumber}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ...round.matches.map((match) => MatchWidget(match: match)).toList(),
      ],
    );
  }
}

class MatchWidget extends StatelessWidget {
  final Match match;

  MatchWidget({required this.match});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
          Text('Match ${match.matchNumber}', style: TextStyle(fontFamily: "poppins", fontWeight: FontWeight.bold, fontSize: 12, color: Colors.green,
      ),),

          ...match.players.map((player) => Playercard(player: player)).toList(),
          if (match.winner != null) Text('Winner: ${match.winner!.name}'),
        ],
      ),
    );
  }
}
