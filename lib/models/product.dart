import 'package:flutter/material.dart';

class Product {
  num id;
  String title;
  num price;
  String category;
  String description;
  String image_url;
  bool isAdded;
  Product(
      {this.isAdded = false,
      this.id,
      this.title,
      this.price,
      this.category,
      this.description,
      this.image_url});
  void toggleAdded() {
    isAdded = !isAdded;
  }
}
