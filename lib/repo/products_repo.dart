import 'package:http/http.dart' as http;

import '../models/products_model.dart';

class ProductsRepo {
  Future<ProductsModel> getProducts() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      // print(response.body);
      return productsModelFromJson(response.body);
    } else {
      throw Exception("Failed to Load Products");
    }
  }
}
