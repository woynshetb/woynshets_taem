import 'package:flutter/material.dart';

class Product {
  int id;
  String title;
  double price;
  String category;
  String description;
  String image_url;

  Product(
      {this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image_url});
}
