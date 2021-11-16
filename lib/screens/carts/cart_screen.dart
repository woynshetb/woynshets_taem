import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/carts/components/body.dart';
import 'package:woynshet_taem/size_config.dart';

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
      appBar: buildAppBar(context),
      body: Body(
        title: title,
        productId: productId,
        price: price,
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      children: [
        Text(
          "Your Cart",
          style: TextStyle(),
        ),
        Text(
          "4 items",
          style: Theme.of(context).textTheme.caption,
        )
      ],
    ),
  );
}
