part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeGetNewsDataEvent extends HomeEvent {}