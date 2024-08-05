import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHome>((event, emit) {
      // Simulating fetching welcome message
      final welcomeMessage = 'Welcome to the Home Screen!';
      emit(HomeLoaded(welcomeMessage));
    });
  }
}
