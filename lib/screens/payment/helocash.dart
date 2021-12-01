import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:woynshet_taem/components/default_button.dart';
import 'package:http/http.dart' as http;
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
belchashPayment(
    num amount, String phonenumber, DateTime date, String randomT) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('https://woynshetstaem.herokuapp.com/orders'));

  request.body = json.encode({
    "mobile_phone": phonenumber,
    "description": "Payment for products in $date ",
    "amount": amount
  });

  request.headers.addAll(headers);

  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    var decode = jsonDecode(response.body);
    print(decode["status"]);
    print(response.body);
    print(jsonDecode(response.body));

    print("yessss");

    (jsonDecode(response.body));
    return decode;
  } else {
    print("whyy is");
    print(response.reasonPhrase);
    print(response.statusCode);
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
                print(today.add(Duration(days: 3)));

                var decode = await belchashPayment(
                    widget.amount,
                    "${Provider.of<Auth>(context, listen: false).user[0].phoneNumber}",
                    today.add(Duration(days: 3)),
                    code.toString());
                print(decode);
                print(decode['status']);
                String status = decode['status'];
                String expires = decode['expires'];
                String reference = decode['reference'];
                Provider.of<SingleResponse>(context, listen: false).addHistory(
                    status: status, expires: expires, reference: reference);

                decode['status'] != null
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Success()))
                    : CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
