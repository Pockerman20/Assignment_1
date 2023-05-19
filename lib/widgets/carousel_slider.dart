import 'package:assignment_infoware/bloc/products_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../screens/product_details/productdetail_screen.dart';

Widget carouselSlider(ProductsLoadedState state) {
  return CarouselSlider.builder(
    itemCount: 10,
    itemBuilder: (context, index, realIndex) {
      var data = state.productsModel.products![index];
      return Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(data),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                data.thumbnail!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                data.title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
      // );
    },
    options: CarouselOptions(
      enableInfiniteScroll: true,
      enlargeCenterPage: true,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
    ),
  );
}
