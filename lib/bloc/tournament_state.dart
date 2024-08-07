// lib/bloc/tournament_state.dart
import '../Models/round.dart';

abstract class TournamentState {}



class TournamentInitial extends TournamentState {
  String message = "Please add Players";
}

class TournamentUpdated extends TournamentState {
  final List<Round> rounds;
  final String stageName;

  TournamentUpdated(this.rounds,this.stageName);
}
