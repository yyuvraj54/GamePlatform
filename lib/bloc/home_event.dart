import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();


  // this is not important
  @override
  List<Object> get props => [];
}

class LoadHome extends HomeEvent {}