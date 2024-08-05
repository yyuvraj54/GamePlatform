import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  // no need of this
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}


// no need of this
class HomeLoaded extends HomeState {
  final String welcomeMessage;

  const HomeLoaded(this.welcomeMessage);

  @override
  List<Object> get props => [welcomeMessage];
}
