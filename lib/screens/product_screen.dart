import 'package:assignment_infoware/drawer/sidescreen.dart';
import 'package:assignment_infoware/widgets/carousel_slider.dart';
import 'package:assignment_infoware/widgets/headline_constructo.dart';
import 'package:assignment_infoware/widgets/products.grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class ProductScreen extends StatefulWidget {
  static String routeName = "ProductScreen";
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductsLoadedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Data Loaded")));
          } else if (state is ProductsErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Data Not Loaded")));
          }
        },
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ProductsLoadedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  headlineConstruct(
                    title: "Recommended Products",
                    width: 180,
                    fontsize: 17,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  carouselSlider(state),
                  const SizedBox(
                    height: 20,
                  ),
                  headlineConstruct(
                    title: "Products",
                    width: 80,
                    fontsize: 22,
                  ),
                  productGrid(state),
                ],
              ),
            );
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            );
          }
          return const Center(
            child: Text("BLoC Consumer"),
          );
        },
      ),
      // TODO: to make bottomNavitionBar if time left.
      // bottomNavigationBar: ,
    );
  }
}
