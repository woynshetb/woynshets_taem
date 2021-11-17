import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/authenticate/auth.dart';

import 'package:woynshet_taem/size_config.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  final String title;
  final num productId;
  final num price;

  const Body({Key key, this.title, this.productId, this.price})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Cart> futuring;
  List<Cart> summary;
  num total = 0;
  num finallo;

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

  calculateTotal(cartlist) {
    cartlist.forEach((element) {
      total = total + element.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfffcfaf8),
        body: Container(
          padding: EdgeInsets.only(right: 15.0),
          width: MediaQuery.of(context).size.width - 10.0,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
              future: fetchCart(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.list),
                          trailing:
                              Text(snapshot.data[index]['price'].toString()),
                          title: Text(snapshot.data[index]['name']),
                        );
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              }),
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
                  for (var i = 0; i < snapshot.data.length; i++) {
                    total = snapshot.data[0]['price'] + total;
                  }

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "Total:\n\n",
                                  children: [
                                    TextSpan(
                                        text: total.toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(190),
                        child: DefaultButton(
                          text: "Checkout",
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Auth(
                                          productPrice: total,
                                        )));
                          },
                        ),
                      ),
                    ],
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              }),
        ));
  }
}

class Cart {
  String name, productId;
  num price;

  Cart({
    this.price,
    this.name,
    this.productId,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      // not sure about product id
      productId: json['productId'],
      name: json['name'],
      price: json['price'],
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
