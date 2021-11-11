// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import '../models/product.dart';
// import 'dart:core';

// class ProductProvider {
//   static final String BASE_URL = 'https://fakestoreapi.com';
//   static Future<List<Product>> fetchProducts() async {
//     List<Product> products = [];
//     final response = await http.get(Uri.parse(BASE_URL + '/products'));
//     //print(response);
//     if (response.statusCode == 200) {
//       final decoded = await json.decode(response.body);

//       print(decoded);
//       decoded.forEach((p) {
//         print(p);
//         var product = new Product(
//             id: p["id"],
//             title: p["title"],
//             price: p["price"],
//             category: p["category"],
//             description: p["description"],
//             image_url: p["image"]);
//         products.add(product);
//       });

//       return products;
//     } else {
//       throw Exception("An exception occurred");
//     }
//   }

//   static Future<Product> findProduct(int id) async {
//     final response =
//         await http.get(Uri.parse(BASE_URL + '/products/' + id.toString()));
//     if (response.statusCode == 200) {
//       final decoded = await json.decode(response.body);
//       Product product = new Product(
//           id: decoded["id"],
//           title: decoded["title"],
//           price: decoded["price"],
//           category: decoded["category"],
//           description: decoded["description"],
//           image_url: decoded["image"]);
//       return product;
//     } else {
//       throw Exception("An exception occurred");
//     }
//   }

//   static Future<Product> findone(int val) async {
//     final response =
//         await http.get(Uri.parse(BASE_URL + '/products/' + val.toString()));
//     if (response.statusCode == 200) {
//       final decoded = await json.decode(response.body);
//       Product product = new Product(
//           id: decoded["id"],
//           title: decoded["title"],
//           price: decoded["price"],
//           category: decoded["category"],
//           description: decoded["description"],
//           image_url: decoded["image"]);
//       return product;
//     } else {
//       throw Exception("An exception occurred");
//     }
//   }
// }
