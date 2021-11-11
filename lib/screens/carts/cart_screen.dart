import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/carts/components/body.dart';
import 'package:woynshet_taem/size_config.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  final String imagePath, shopename, title;
  final double price;

  const CartScreen(
      {Key key, this.imagePath, this.shopename, this.title, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        title: title,
        imagePath: imagePath,
        shopeName: shopename,
        price: price,
      ),
      bottomNavigationBar: CheckOurCard(),
    );
  }
}

class CheckOurCard extends StatelessWidget {
  const CheckOurCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: getProportionateScreenWidth(40),
                  height: getProportionateScreenHeight(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                  ),
                  child: Icon(
                    Icons.receipt,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                          text: "\$100 Birr",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(190),
              child: DefaultButton(
                text: "Paywith BelCash",
                press: () {},
              ),
            ),
          ],
        ),
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
