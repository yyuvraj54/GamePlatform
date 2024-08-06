// lib/bloc/tournament_event.dart
import '../Models/player.dart';

abstract class TournamentEvent {}

class AddPlayerEvent extends TournamentEvent {
  final Player player;
  AddPlayerEvent(this.player);
}

class ProceedToNextRound extends TournamentEvent {}

class InitializeTournament extends TournamentEvent {}
