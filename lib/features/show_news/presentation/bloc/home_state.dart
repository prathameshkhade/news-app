part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

// Normal States
class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<NewsEntity> newsList;

  HomeLoadedState({required this.newsList});
}

class HomeErrorState extends HomeState {
  final Failure failure;

  HomeErrorState({required this.failure});
}
