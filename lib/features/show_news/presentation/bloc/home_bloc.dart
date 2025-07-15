import 'dart:async';

import 'package:amazon/features/show_news/domain/entity/news_entity.dart';
import 'package:amazon/features/show_news/domain/usecase/get_all_news.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllNewsUseCase newsUseCase;

  HomeBloc(this.newsUseCase) : super(HomeInitial()) {
    on<HomeGetNewsDataEvent>(onHomeLoadDataEvent);
    on<HomeNavigateToDetailedScreenWithHeroAnimation>(onHomeNavigateToDetailedScreenWithHeroAnimation);
  }

  FutureOr<void> onHomeLoadDataEvent(HomeGetNewsDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final newsList = await newsUseCase.call(null);
      newsList.fold(
        (failure) => emit(HomeErrorState(failure: failure)),
        (news) => emit(HomeLoadedState(newsList: news)),
      );
    }
    catch(e) {
      debugPrint('Error in HomeBloc: $e');
      emit(HomeErrorState(failure: Failure(message: e.toString())));
    }
  }

  FutureOr<void> onHomeNavigateToDetailedScreenWithHeroAnimation(HomeNavigateToDetailedScreenWithHeroAnimation event, Emitter<HomeState> emit) {
    emit(HomeNavigateToDetailedScreenWithHeroAnimationActionState(entity: event.entity));
  }
}
