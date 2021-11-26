import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/models/product.dart';
import 'package:woynshet_taem/screens/authenticate/auth.dart';

import 'package:woynshet_taem/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:woynshet_taem/models/cart.dart';

class Body extends StatefulWidget {
  final String title;
  final num productId;
  final num price;

  const Body({Key key, this.title, this.productId, this.price})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

List<Product> product = [];

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    this.fetchCart();
  }

// functon to read from cart db using cart model and generate it with listviewbuilder with streambuilder ( future builder)

  fetchCart() async {
    final response = await http.get(
      Uri.parse(
          'https://woynshetstaem.herokuapp.com/cart/6192566b177824d2013a4b5a'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      var pro = items['products'];
      print('productS=================: $pro.');

      return pro;
    } else {
      print("error");
    }
  }

  addTocart() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfffcfaf8),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            return ListView.builder(
                padding: EdgeInsets.all(30),
                itemCount: cart.basketitem.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.list),
                          Text(
                            "${cart.basketitem[i].title}",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          Text("${cart.basketitem[i].price} Birr"),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.delete_sharp),
                          onPressed: () {
                            cart.remove(cart.basketitem[i]);
                          }),
                    ),
                  );
                });
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(15),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -7),
                blurRadius: 33,
                color: Color(0xFF6DAED9).withOpacity(0.11),
              ),
            ],
          ),
          child: FutureBuilder(
              future: fetchCart(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(
                            width: 20,
                          ),
                          Consumer<Cart>(
                            builder: (context, cart, child) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: "Total:\n\n",
                                      children: [
                                        TextSpan(
                                            text: "${cart.totalPrice}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(190),
                        child: Consumer<Cart>(
                          builder: (context, cart, child) {
                            return DefaultButton(
                              text: "Checkout",
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Auth(
                                              totalPrice: cart.totalPrice,
                                            )));
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                  ));
              }),
        ));
  }
}
