import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:woynshet_taem/components/default_button.dart';
import 'package:http/http.dart' as http;
import 'package:woynshet_taem/models/cart.dart';
import 'package:woynshet_taem/models/item.dart';
import 'package:woynshet_taem/models/response.dart';
import 'package:woynshet_taem/providers/auth.dart';
import 'package:woynshet_taem/providers/getHistory.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButton(
              text: "Confirm Order",
              press: () async {
                // print(today.add(Duration(days: 3)));

                // var decode = await belchashPayment(
                //     widget.amount,
                //     "${Provider.of<Auth>(context, listen: false).user[0].phoneNumber}",
                //     today.add(Duration(days: 3)),
                //     code.toString());
                // print(decode);
                // print(decode['status']);

                // String status = decode['status'];
                // String expires = decode['expires'];
                // String reference = decode['reference'];
                // Provider.of<SingleResponse>(context, listen: false).addHistory(
                //     status: status, expires: expires, reference: reference);

                // decode['status'] != null
                //     ? Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => Success()))
                //     : CircularProgressIndicator();

                List productList =
                    Provider.of<Cart>(context, listen: false).basketitem;
                print(productList.length);

                var list = List<Item>.generate(
                    productList.length,
                    (index) => Item(productList[index].ProductId,
                        productList[index].price, productList[index].title));

                var r = list
                    .map(
                      (e) => e.ProductId,
                    )
                    .toList();
                print(r);

// this is new
                // List<Item> allProduct =
                //     Provider.of<Cart>(context, listen: false).basketitem;
                // print(jsonEncode(allProduct));

                // new
                //  var r = list.map((e) => {e.ProductId, e.title, e.price});

                await helocash(
                    widget.amount,
                    "${Provider.of<Auth>(context, listen: false).user[0].phoneNumber}",
                    today.add(Duration(days: 3)),
                    code.toString(),
                    r);

                // Map<String, String> data;

                // for (int i = 0; i < productList.length; i++) {
                //   data.addAll(
                //     {"productId": productList[i].ProductId},
                //   );
                //   data.addAll(
                //     {"name": productList[i].title},
                //   );
                //   data.addAll(
                //     {"price": productList[i].price},
                //   );
                // }
                // print(data);
              },
            )
          ],
        ),
      ),
    );
  }
}
