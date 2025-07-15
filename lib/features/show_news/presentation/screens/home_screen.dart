import 'package:amazon/features/show_news/presentation/bloc/home_bloc.dart';
import 'package:amazon/features/show_news/presentation/widget/news_overview_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/error_widget.dart';
import '../../../../core/common/loader.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeGetNewsDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News App"),
        ),

        body: BlocConsumer<HomeBloc, HomeState>(
          buildWhen: (previous, current) => current is! HomeActionState,
          listenWhen: (previous, current) => current is HomeActionState,
          listener: (context, state) {
            if (state is HomeNavigateToDetailedScreenWithHeroAnimationActionState) {
              Navigator.push(
                context,
                DetailsScreen.route(state.entity),
              );
            }
          },
          builder: (context, state) {
            switch(state.runtimeType) {
              case const (HomeLoadingState): {
                return const Loader();
              }
              case const (HomeErrorState): {
                state = state as HomeErrorState;
                return ErrWidget(failure: state.failure);
              }
              case const (HomeLoadedState): {
                state = state as HomeLoadedState;
                final list = state.newsList;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) => NewsOverviewTile(
                    news: list[index],
                    onTap: () {
                      context.read<HomeBloc>().add(
                        HomeNavigateToDetailedScreenWithHeroAnimation(entity: list[index])
                      );
                    },
                  ),
                );
              }
            }
            return Center(
              child: Text('Unknown state: ${state.runtimeType}'),
            );
          },
        )
    );
  }
}
