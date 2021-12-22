import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/models/response.dart';
import 'package:woynshet_taem/providers/auth.dart';

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
var value;

Future<Helo> belchashPayment(
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
    return Helo.fromJson(jsonDecode(response.body));
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
  } catch (exception) {
  } finally {}
}

class _GuestAccountState extends State<GuestAccount> {
  Future<Helo> futureHistory;
  String number;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Text("Guest Account ",
                    style: TextStyle(
                        fontFamily: "Kiros",
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter Your Mobile Number to Process Your Checkout",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Kiros",
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(7),
                  child: TextFormField(
                    controller: phoneNumberTextEditingController,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.orange,
                      ),
                      focusColor: Colors.orange,
                      hintText: 'enter Phone number',
                    ),
                    onChanged: (value) {
                      number = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<Auth>(
                        builder: (context, auth, child) {
                          return DefaultButton(
                            text: "Register",
                            press: () {
                              print("this is texy");
                              print(number);
                              auth.guestCreation(number);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class History {
  final String expires;
  final String date;
  final String code;
  final String id;
  final num amount;
  final String status;
  History(
      {this.id, this.amount, this.status, this.code, this.expires, this.date});
  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      date: json['date'],
      expires: json['expires'],
      code: json['code'],
      id: json['id'],
      amount: json['amount'],
      status: json['status'],
    );
  }
}
