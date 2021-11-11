import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/products.dart';
import 'dart:core';

class ProductProvider {
  static final String BASE_URL = 'https://fakestoreapi.com';
  static Future<List<Product>> fetchProducts() async {
    List<Product> products = [];
    final response = await http.get(Uri.parse(BASE_URL + '/products'));
    print(response);
    if (response.statusCode == 200) {
      final decoded = await json.decode(response.body);

      // print(decoded);
      decoded.forEach((p) {
        print(p);
        var product = new Product(
            title: p["title"],
            price: p["price"],
            description: p["description"],
            image_url: p["image"]);
        products.add(product);
      });

      return products;
    } else {
      throw Exception("An exception occurred");
    }
  }
}
