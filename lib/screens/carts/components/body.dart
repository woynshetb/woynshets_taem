import 'dart:convert';

import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/authenticate/auth.dart';
import 'package:woynshet_taem/screens/payment/guestpayment.dart';
import 'package:woynshet_taem/size_config.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  final String title, imagePath;
  final double price;

  const Body({Key key, this.title, this.imagePath, this.price})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Cart> cart = [];

  // add function to pass information and add to the list
  @override
  void initState() {
    cart.add(Cart(
      imagePath: widget.imagePath,
      price: widget.price,
      title: widget.title,
    ));

    super.initState();
    addTocart(
      "userId",
      widget.title,
      widget.price,
    );
  }

// this doesnt work b/c it is not uploaded to heroku = b/c local host for phone and pc is not the same

  addTocart(String userId, String productname, num price) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('http://localhost:4000/cart'));
    request.fields.addAll({
      // for 3 status there will be user id
      'userId': '${userId}',
      // generate product id by using  uuid package
      'productId': 'Taem',
      'quantity': '1',
      'name': '${productname}',
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

// functon to read from cart db using cart model and generate it with listviewbuilder with streambuilder ( future builder)
  fetchFromCart() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Column(
            children: cart.map((carts) {
              return Slidable(
                key: Key(carts.title),
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.15,
                actions: [],
                child: Card(
                  child: ListTile(
                    title: Text(carts.title),
                    subtitle: Text(carts.price.toString()),
                  ),
                ),
                secondaryActions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    child: Icon(Icons.delete),
                    onPressed: () {
                      cart.removeWhere((element) {
                        return element.title == carts.title;
                      });
                      setState(() {});
                    },
                  ),
                ],
              );
            }).toList(),
          ),
          Column(
            children: cart
                .map((cartye) => Container(
                      child: CheckOurCard(
                        desc: cartye.title,
                        price: cartye.price,
                      ),
                    ))
                .toList(),
          )
        ]),
      ),
    ));
  }
}

class Cart {
  String title, imagePath, shopeName;
  double price;

  Cart({this.imagePath, this.price, this.shopeName, this.title});
}

class CheckOurCard extends StatelessWidget {
  final String desc;
  final num price;

  const CheckOurCard({Key key, this.desc, this.price}) : super(key: key);

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
                          text: price.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: getProportionateScreenWidth(190),
              child: DefaultButton(
                text: "Checkout",
                press: () {
                  // this function will apply to guest
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Auth(
                                productName: desc,
                                productPrice: price,
                              )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
