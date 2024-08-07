import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/widgets/PlayerCard.dart';

// lib/widgets/round_widget.dart
import 'package:flutter/material.dart';

import'../Models/round.dart';
import'../Models/player.dart';
import '../Models/match.dart';

class RoundWidget extends StatelessWidget {
  final Round round;

  RoundWidget({required this.round});

  @override
  Widget build(BuildContext context) {
    int matchNumber = 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text('Quarter Finals: ${round.roundNumber}', style: TextStyle(color: Colors.white, fontSize:   20, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 20),
        ...round.matches.map((match) {
            final widget = MatchWidget(match: match, matchNumber: matchNumber);
            matchNumber++;
            return widget;
        }).toList(),

    ],
    );
  }
}


class MatchWidget extends StatelessWidget {
  final Match match;
  final int matchNumber;

  MatchWidget({required this.match, required this.matchNumber});

  @override
  Widget build(BuildContext context) {

    // Determine gradient types based on player scores
    GradientType getGradientType(Player player, List<Player> opponents) {
      if (opponents.isEmpty) {
        return GradientType.gold; // Solo player
      } else {
        Player opponent = opponents.first;
        if (player.score > opponent.score) {
          return GradientType.green;
        } else {
          return GradientType.none;
        }
      }
    }

    return Card(
      color: Colors.black,
      child: Column(
        children: [
          Text(
            'Match ${matchNumber}',
            style: TextStyle(fontFamily: "poppins", fontWeight: FontWeight.bold, fontSize: 12, color: Colors.green,),
          ),
          ...match.players.map((player) {

            List<Player> opponents = match.players.where((p) => p != player).toList();
            return Playercard(
              player: player,
              gradientType: getGradientType(player, opponents),
            );
          }).toList(),
          if (match.winner != null) Text('Winner: ${match.winner!.name}'),
        ],
      ),
    );
  }
}