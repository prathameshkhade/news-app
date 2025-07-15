part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeGetNewsDataEvent extends HomeEvent {}

class HomeNavigateToDetailedScreenWithHeroAnimation extends HomeEvent {
  final NewsEntity entity;

  HomeNavigateToDetailedScreenWithHeroAnimation({required this.entity});
}