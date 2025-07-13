import 'dart:async';
import 'package:amazon/data/cart_items.dart';
import 'package:amazon/data/products_data.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitEvent>(homeInitEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductAddToCartBtnPressed>(homeProductAddToCartBtnPressed);
  }

  FutureOr<void> homeInitEvent(HomeInitEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedState(products: FakeProductList.products));
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint('HomeCartButtonNavigateEvent triggered');
    emit(HomeCartButtonNavigateState());
  }

  FutureOr<void> homeProductAddToCartBtnPressed(HomeProductAddToCartBtnPressed event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductAddedToCartState());
  }
}
