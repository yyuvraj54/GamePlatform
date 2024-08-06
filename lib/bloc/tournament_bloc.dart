// lib/bloc/tournament_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/player.dart';
import '../repositories/tournament_repository.dart';
import 'tournament_event.dart';
import 'tournament_state.dart';

class TournamentBloc extends Bloc<TournamentEvent, TournamentState> {
  final TournamentRepository repository;

  TournamentBloc(this.repository) : super(TournamentInitial()) {
    on<AddPlayerEvent>((event, emit) {
      repository.addPlayer(event.player);
      emit(TournamentUpdated(repository.rounds));
    });
    on<ProceedToNextRound>((event, emit) {
      repository.proceedToNextRound();
      emit(TournamentUpdated(repository.rounds));
    });
    on<InitializeTournament>((event, emit) {
      emit(TournamentUpdated(repository.rounds));
    });
  }
}
