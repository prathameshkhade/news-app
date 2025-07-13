import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/products_data.dart';
import '../bloc/home_bloc.dart';

class ProductContainer extends StatelessWidget {

  final Product product;
  final HomeBloc homeBloc;

  const ProductContainer({
    super.key,
    required this.product,
    required this.homeBloc
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 20,
        children: [
          // Image
          Image.network(product.imageUrl, fit: BoxFit.fill),

          // Title and price
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            title: Text(product.name),
            subtitle: Text("\$${product.price}"),
            trailing: IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductAddToCartBtnPressed(clickedProduct: product));
                },
                icon: Icon(Icons.add_shopping_cart_outlined)
            ),
          )
        ],
      ),
    );
  }
}
