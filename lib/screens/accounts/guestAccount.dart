import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:woynshet_taem/Widgets/customTextField.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/screens/profile/profilePage.dart';

class GuestAccount extends StatefulWidget {
  final num total;

  const GuestAccount({Key key, this.total}) : super(key: key);

  @override
  _GuestAccountState createState() => _GuestAccountState();
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
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmluY2lwYWwiOiIxMzc2NDUwIiwic3lzdGVtIjoibHVjeSIsImdyb3VwIjoiYnVzaW5lc3MiLCJ1c2VybmFtZSI6IjEzNzY0NTAiLCJjaGFpbiI6WyJwYXNzd29yZCJdLCJpYXQiOjE2MzcyNDA0NjQsImV4cCI6MTYzNzMyNjg2NH0.TVlfl1C7Fj3Mjc8Y6vJHHVl7-AwRE-d4NGu5SItXj_Q',
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
    print(await response.stream.bytesToString());
    print("yessss");
  } else {
    print("whyy is");
    print(response.reasonPhrase);
    print(response.statusCode);
  }
}

guestCreation(String phoneNumber) async {
  try {
    var url = Uri.parse('https://woynshetstaem.herokuapp.com/guest');
    var request = http.MultipartRequest('POST', url);
    request.fields['phoneNumber'] = phoneNumber;

    http.StreamedResponse response = await request.send();
    final responseString = await http.Response.fromStream(response);
    print(jsonDecode(responseString.body));
    var respo = await json.decode(responseString.body);
    print(respo);
  } catch (exception) {} finally {}
}

class _GuestAccountState extends State<GuestAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text("Total"),
              Text("Enter your phone number to checkout"),
              Text(widget.total.toString()),

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
                  guestCreation(phoneNumberTextEditingController.text);
                  belchashPayment(
                      widget.total,
                      phoneNumberTextEditingController.text,
                      today.add(Duration(days: 3)),
                      code.toString());
                  // go to profile page by passing id as parameter
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreenPage()));
                },
              )

              // DefaultButton(
              //   text: "Click to confirm",
              //   press: guestCreation(widget.total),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
