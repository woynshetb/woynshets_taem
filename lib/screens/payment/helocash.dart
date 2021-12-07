import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:woynshet_taem/components/default_button.dart';
import 'package:http/http.dart' as http;
import 'package:woynshet_taem/models/cart.dart';
import 'package:woynshet_taem/models/item.dart';

import 'package:woynshet_taem/providers/auth.dart';
import 'package:woynshet_taem/screens/authenticate/auth.dart';
import 'package:woynshet_taem/screens/success/success.dart';

class Payment extends StatefulWidget {
  final num amount;

  Payment({Key key, this.amount});

  @override
  _PaymentState createState() => _PaymentState();
}

var today = DateTime.now();
var rng = new Random();
var code = rng.nextInt(900000) + 100000;

TextEditingController phoneNumberTextEditingController =
    TextEditingController();

helocash(
    num amount, String phonenumber, DateTime date, String randomT, r) async {
  var headers = {'Content-Type': 'application/json'};
  final url = Uri.parse('https://woynshetstaem.herokuapp.com/orders');

  Map payload = {
    "userPhoneNumber": phonenumber,
    "payWith": "Helocash",
    "totalPrice": amount,
    "productsId": r.toString(),
    "description": "for the product"
  };

  final response =
      await http.post(url, headers: headers, body: json.encode(payload));

  if (response.statusCode == 200) {
    var decode = jsonDecode(response.body);
    print(decode["status"]);
    print(response.body);
    print(jsonDecode(response.body));
  } else {
    print(response.reasonPhrase);
  }
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Consumer<Auth>(
          builder: (context, auth, child) {
            return auth.user.length == 0
                ? Authen()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Confirm Order ",
                          style: TextStyle(
                              fontFamily: "Kiros",
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " With ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Kiros",
                                  fontWeight: FontWeight.w900),
                            ),
                            IconButton(
                              onPressed: () async {
                                List productList =
                                    Provider.of<Cart>(context, listen: false)
                                        .basketitem;
                                print(productList.length);

                                var list = List<Item>.generate(
                                    productList.length,
                                    (index) => Item(
                                        productList[index].ProductId,
                                        productList[index].price,
                                        productList[index].title));

                                var r = list
                                    .map(
                                      (e) => e.ProductId,
                                    )
                                    .toList();
                                print(r);

                                await helocash(
                                    widget.amount,
                                    "${Provider.of<Auth>(context, listen: false).user[0].phoneNumber}",
                                    today.add(Duration(days: 3)),
                                    code.toString(),
                                    r);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Success()));
                              },
                              icon: Image.asset('assets/images/helo.png'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " With ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Kiros",
                                  fontWeight: FontWeight.w900),
                            ),
                            IconButton(
                              icon: Image.asset('assets/images/mama.jpg'),
                              iconSize: 100,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
