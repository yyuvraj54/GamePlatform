import 'dart:developer';
import 'dart:math';
import '../widgets/MatchWidget.dart';
import '../widgets/PlayerCard.dart';
import '../widgets/popbox/popWidget.dart';
import '/Models/player.dart';
import '/Models/match.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/round.dart';

class TournamentScreen extends StatefulWidget {
  @override
  _TournamentScreenState createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  List<Round> rounds = [];
  List<Player> players = [
    Player(id: '1', name: 'Player 1', image: 'image1.png', score: 0),
    Player(id: '2', name: 'Player 2', image: 'image2.png', score: 0),
    // Add more players
  ];



  @override
  void initState() {
    super.initState();

    rounds.add(Round(roundNumber: 1, matches: createInitialMatches(players)));
  }

  void addPlayer(Player player) {
    setState(() {
      players.add(player);
      rounds = [Round(roundNumber: 1, matches: createInitialMatches(players))];
    });
  }

  void _addPlayer(String name, String gamerId) {
    // Create a new player object and add it to the list
    setState(() {
      addPlayer(Player(id: gamerId, name: name, image: "image", score: 29));
    });
  }

  void proceedToNextRound() {
    List<Match> nextRoundMatches = getNextRoundMatches(rounds.last.matches);
    if (nextRoundMatches.length > 1 || nextRoundMatches[0].players.length > 1) {
      rounds.add(Round(roundNumber: rounds.length + 1, matches: nextRoundMatches));
      setState(() {});
    } else {
      // Final match reached
      print('Winner: ${nextRoundMatches[0].players[0].name}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
       children:[ 
         Expanded(
           child: ListView.builder(
                   itemCount: rounds.length,
                   itemBuilder: (context, index) {
              return RoundWidget(round: rounds[index]);
                   },
                 ),
         ),
         ElevatedButton(onPressed: (){ showAddPlayerDialog(context,_addPlayer);}, child: Text("click"))


    ]);
  }
}



List<Match> createInitialMatches(List<Player> players) {
  List<Match> matches = [];
  for (int i = 0; i < players.length; i += 2) {
    if (i + 1 < players.length) {
      matches.add(Match(matchNumber: matches.length + 1,
          players: [players[i], players[i + 1]]));
    } else {
      matches.add(
          Match(matchNumber: matches.length + 1, players: [players[i]]));
    }
  }
  return matches;
}

List<Match> getNextRoundMatches(List<Match> previousRoundMatches) {
  List<Match> nextRoundMatches = [];
  List<Player> winners = previousRoundMatches.map((match) {
    if (match.players.length == 1) {
      return match.players[0];
    } else {
      // Randomly select a winner
      return match.players[Random().nextInt(2)];
    }
  }).toList();

  for (int i = 0; i < winners.length; i += 2) {
    if (i + 1 < winners.length) {
      nextRoundMatches.add(Match(matchNumber: nextRoundMatches.length + 1,
          players: [winners[i], winners[i + 1]]));
    } else {
      nextRoundMatches.add(Match(
          matchNumber: nextRoundMatches.length + 1, players: [winners[i]]));
    }
  }
  return nextRoundMatches;
}