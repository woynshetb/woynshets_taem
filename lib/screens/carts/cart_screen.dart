import 'package:flutter/material.dart';

import 'package:woynshet_taem/screens/carts/components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  final String title;
  final num productId;
  final double price;

  const CartScreen({Key key, this.productId, this.title, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        title: title,
        productId: productId,
        price: price,
      ),
    );
  }
}
