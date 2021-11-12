import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:woynshet_taem/Widgets/customTextField.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:http/http.dart' as http;

class Payment extends StatefulWidget {
  final String title;
  final num amount;

  const Payment({Key key, this.title, this.amount}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

TextEditingController phoneNumberTextEditingController =
    TextEditingController();
belchashPayment(String desc, num amount, String phonenumber) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmluY2lwYWwiOiIxMzc2NDUwIiwic3lzdGVtIjoibHVjeSIsImdyb3VwIjoiYnVzaW5lc3MiLCJ1c2VybmFtZSI6IjEzNzY0NTAiLCJjaGFpbiI6WyJwYXNzd29yZCJdLCJpYXQiOjE2MzY3NDAxNjMsImV4cCI6MTYzNjgyNjU2M30.__AKWtxl82aiUFAbv8aa4Hy296iaLcVPqaYHqo8HOm4',
    'Content-Type': 'application/json'
  };
  var request =
      http.Request('POST', Uri.parse('https://api-et.hellocash.net/invoices'));
  request.body = json.encode({
    "amount": amount,
    "description": desc,
    "from": "+251911310051",
    "currency": "ETB",
    "tracenumber": "8354454748",
    "notifyfrom": true,
    "notifyto": true,
    "expires": "2021-11-14"
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
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
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            DefaultButton(
              text: "Check out and Confirm with your phone",
              press: () {
                belchashPayment(widget.title, widget.amount,
                    phoneNumberTextEditingController.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
