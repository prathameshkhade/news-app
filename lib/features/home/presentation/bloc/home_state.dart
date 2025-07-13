part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

// Normal states
class HomeLoadingState extends HomeState{}

class HomeLoadedState extends HomeState{
  final List<Product> products;

  HomeLoadedState({required this.products});
}

class HomeErrorState extends HomeState{}

// Action states
class HomeCartButtonNavigateState extends HomeActionState{}
