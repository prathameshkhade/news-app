import 'package:amazon/features/cart/presentation/pages/cart_page.dart';
import 'package:amazon/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeCartButtonNavigateState) {
          Navigator.push(
            context,
            CartPage.route()
          );
        }
        else if (state is HomeProductAddedToCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Item Added to cart!"))
          );
        }
      },
      builder: (context, state) {
        switch(state.runtimeType) {
          case const (HomeLoadingState):
            return Scaffold(
              body: Center(child: const CircularProgressIndicator()),
            );

          case const (HomeErrorState):
            return Scaffold(
              body: Center(child: const Text('Error: Something went wrong!')),
            );

          case const (HomeLoadedState):
            final loadedState = state as HomeLoadedState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Products'),
                actions: <IconButton>[
                  // Cart button
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                  ),
                ],
              ),
              body: ListView.separated(
                  itemCount: loadedState.products.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemBuilder: (context, index) => ProductContainer(
                    homeBloc: homeBloc,
                    product: loadedState.products[index],
                  ),
              ),
            );

          default:
            return Scaffold(
              body: Center(child: const Text('Error: Something went wrong!')),
            );
        }
      },
    );
  }
}
