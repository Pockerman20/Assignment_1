import 'package:flutter/material.dart';

import '../bloc/products_bloc.dart';
import '../screens/product_details/productdetail_screen.dart';

Widget productGrid(ProductsLoadedState state) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(10.0),
    itemCount: state.productsModel.products!.length,
    itemBuilder: (context, index) {
      var data = state.productsModel.products![index];
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              data.title!,
              textAlign: TextAlign.center,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(data),
                ),
              );
            },
            child: Image.network(
              data.thumbnail!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    },
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 8 / 9,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
    ),
  );
}
