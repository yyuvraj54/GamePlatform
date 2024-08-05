import 'player.dart';
class Match {

  final int matchNumber;
  final List<Player> players;
  Player? winner;

  Match({required this.matchNumber, required this.players, this.winner});
}
