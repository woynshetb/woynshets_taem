import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:woynshet_taem/Widgets/customTextField.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:http/http.dart' as http;
import 'package:woynshet_taem/screens/profile/profilePage.dart';

class Payment extends StatefulWidget {
  final num amount;

  const Payment({Key key, this.amount}) : super(key: key);

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
  var headers = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmluY2lwYWwiOiIxMzc2NDUwIiwic3lzdGVtIjoibHVjeSIsImdyb3VwIjoiYnVzaW5lc3MiLCJ1c2VybmFtZSI6IjEzNzY0NTAiLCJjaGFpbiI6WyJwYXNzd29yZCJdLCJpYXQiOjE2Mzc1ODU3NDAsImV4cCI6MTYzNzY3MjE0MH0.zg7zfbdHudWktaOlshrGAS0_NGsqXb-Zh5-8X2PcIBE',
    'Content-Type': 'application/json'
  };
  var request =
      http.Request('POST', Uri.parse('https://api-et.hellocash.net/invoices'));
  request.body = json.encode({
    "amount": amount,
    "description": "Payment for products in $date ",
    "from": phonenumber,
    "currency": "ETB",
    "tracenumber": "${randomT}",
    "notifyfrom": true,
    "notifyto": true,
    "expires": DateFormat("yyyy-MM-dd").format(date),
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(phonenumber);
    print(amount);
    print(randomT);
    print(date);
    print(await response.stream.bytesToString());
    print("yessss");
  } else {
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
            CustomeTextField(
              isObsecure: false,
              controller: phoneNumberTextEditingController,
              data: Icons.phone,
              hintText: "please enter with +2519.....",
              val: (controller) {
                if (controller == null || controller.isEmpty) {
                  print(phoneNumberTextEditingController);
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            DefaultButton(
              text: "Check out and Confirm with your phone",
              press: () {
                //  print(phoneNumberTextEditingController);
                print(today.add(Duration(days: 3)));
                // belchashPayment(
                //     widget.amount,
                //     phoneNumberTextEditingController.text,
                //     today.add(Duration(days: 3)),
                //     code.toString());
                // go to profile page by passing id as parameter
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ProfileScreenPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
