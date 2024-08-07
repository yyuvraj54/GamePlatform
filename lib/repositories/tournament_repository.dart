// lib/repositories/tournament_repository.dart
import 'dart:math';
import '../Models/player.dart';
import '../Models/match.dart';
import '../Models/round.dart';

class TournamentRepository {
  List<Player> players = [];

  List<Round> rounds = [];

  TournamentRepository() {
    rounds.add(Round(roundNumber: 1, matches: createInitialMatches(players)));
  }

  List<Match> createInitialMatches(List<Player> players) {
    List<Match> matches = [];
    for (int i = 0; i < players.length; i += 2) {
      if (i + 1 < players.length) {
        matches.add(Match(matchNumber: matches.length + 1, players: [players[i], players[i + 1]]));
      } else {
        matches.add(Match(matchNumber: matches.length + 1, players: [players[i]]));
      }
    }
    return matches;
  }

  List<Match> getNextRoundMatches(List<Match> previousRoundMatches) {
    List<Match> nextRoundMatches = [];
    List<Player> winners = [];

    for (Match match in previousRoundMatches) {
      if (match.players.length == 1) {
        winners.add(match.players[0]);
      } else {
        Player winner = match.players[0].score > match.players[1].score
            ? match.players[0]
            : match.players[1];
        winners.add(winner);
      }
    }

    for (int i = 0; i < winners.length; i += 2) {
      if (i + 1 < winners.length) {
        nextRoundMatches.add(Match(
          matchNumber: nextRoundMatches.length + 1,
          players: [winners[i], winners[i + 1]],
        ));
      } else {
        nextRoundMatches.add(Match(
          matchNumber: nextRoundMatches.length + 1,
          players: [winners[i]],
        ));
      }
    }
    return nextRoundMatches;
  }

  void addPlayer(Player player) {

    players.add(player);
    rounds = [Round(roundNumber: 1, matches: createInitialMatches(players))];
    print("Logcatplease "+roundsToString());

    for(int i=0; i<getRounds().length; i++){
      proceedToNextRound();
    }
  }

  void proceedToNextRound() {
    List<Match> nextRoundMatches = getNextRoundMatches(rounds.last.matches);
    if (nextRoundMatches.length > 1 || nextRoundMatches[0].players.length > 1) {
      rounds.add(Round(roundNumber: rounds.length + 1, matches: nextRoundMatches));
    } else {
      print('Winner: ${nextRoundMatches[0].players[0].name}');
    }
  }
  List<Round> getRounds() {
    return rounds;
  }

  String getStageName(int numberOfPlayers) {
    if (numberOfPlayers <= 2) {
      return 'Final';
    } else if (numberOfPlayers == 3) {
      return 'Semi-Final';
    } else if (numberOfPlayers <= 5) {
      return 'Quarter-Final';
    } else {
      return 'Round $numberOfPlayers';
    }
  }


  String roundsToString() {
    return rounds.map((round) {
      return 'Round ${round.roundNumber}:\n' +
          round.matches.map((match) {
            String matchString = '  Match ${match.matchNumber}:\n' +
                match.players.map((player) {
                  return '    Player: ${player.name}, Score: ${player.score}';
                }).join('\n');
            if (match.players.length == 1) {
              matchString += '\n    Winner: ${match.players[0].name}';
            } else {
              Player winner = match.players[0].score > match.players[1].score
                  ? match.players[0]
                  : match.players[1];
              matchString += '\n    Winner: ${winner.name}';
            }
            return matchString;
          }).join('\n');
    }).join('\n\n');
  }
}
