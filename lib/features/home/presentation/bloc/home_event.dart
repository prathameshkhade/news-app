part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitEvent extends HomeEvent{}

class HomeProductAddToCartBtnPressed extends HomeEvent{
  final Product clickedProduct;

  HomeProductAddToCartBtnPressed({
    required this.clickedProduct
  });
}

class HomeCartButtonNavigateEvent extends HomeEvent{}


