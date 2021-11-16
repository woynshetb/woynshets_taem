import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/authenticate/auth.dart';

import 'package:woynshet_taem/size_config.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  final String title;
  final num productId;
  final double price;

  const Body({Key key, this.title, this.productId, this.price})
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
      //imagePath: widget.imagePath,
      price: widget.price,
      name: widget.title,
    ));

    super.initState();
    // addTocart(
    //   "6192566b177824d2013a4b5a",
    //   widget.title,
    //   widget.price,
    //   widget.productId,
    // );
  }

  addTocart(String userId, String productname, num price, num productId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://woynshetstaem.herokuapp.com/cart'));
    request.body = json.encode({
      "productId": productId,
      "name": productname,
      "price": price,
      "userId": userId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("added");
    } else {
      print(response.reasonPhrase);
    }
  }

// functon to read from cart db using cart model and generate it with listviewbuilder with streambuilder ( future builder)

  Future<Cart> fetchCart() async {
    final response =
        await http.get(Uri.parse('https://woynshetstaem.herokuapp.com/cart'));

    if (response.statusCode == 200) {
      return Cart.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load cart');
    }
  }

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
                key: Key(carts.name),
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.15,
                actions: [],
                child: Card(
                  child: ListTile(
                    title: Text(carts.name),
                    subtitle: Text(carts.price.toString()),
                  ),
                ),
                secondaryActions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    child: Icon(Icons.delete),
                    onPressed: () {
                      cart.removeWhere((element) {
                        return element.name == carts.name;
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
                        desc: cartye.name,
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
  String name, productId;
  num price;
  num quantity;

  Cart({this.price, this.name, this.productId, this.quantity});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      // not sure about product id
      productId: json['productId'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
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
