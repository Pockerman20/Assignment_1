import 'package:assignment_infoware/models/products_model.dart';
import 'package:assignment_infoware/screens/product_details/product_carousel.dart';
import 'package:assignment_infoware/widgets/headline_constructo.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetailScreen extends StatefulWidget {
  static String routeName = "ProductDetailScreen";
  final Product product;
  const ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Widget textfor(String title, double fontsize, FontWeight fontweight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontsize,
          color: Theme.of(context).primaryColor,
          fontWeight: fontweight,
        ),
      ),
    );
  }

  NumberFormat formatter = NumberFormat('00');
  int _qty = 1;
  int tagIndex = 0;
  int _currentIndex = 0;

  // void _onPageChanged(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              headlineConstruct(
                  title: widget.product.title!, width: 200, fontsize: 20),
              const SizedBox(
                height: 5,
              ),
              // productCarouselSlider(
              //   widget.product.images!,
              // ),
              productCarouselSlider(
                widget.product.images!,
                onPageChanged: (index, CarouselPageChangedReason reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.product.images!.map((e) {
                  int index = widget.product.images!.indexOf(e);
                  return Container(
                    width: 6,
                    height: 6,
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.grey.shade600
                            : Colors.grey.shade400),
                  );
                }).toList(),
              ),
              textfor(widget.product.title!, 24, FontWeight.w600),
              textfor('₹${widget.product.price!.toStringAsFixed(2)}', 18,
                  FontWeight.w400),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 2, 220, 2),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (_qty > 1) {
                          setState(() {
                            _qty--;
                          });
                        }
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 32,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Text(
                      formatter.format(_qty),
                      // qty.toString(),
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade800),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _qty++;
                        });
                      },
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        size: 32,
                        color: Colors.grey.shade800,
                      ),
                    )
                  ],
                ),
              ),
              headlineConstruct(
                title: "About",
                width: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.product.description!),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              'Add to Card',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
