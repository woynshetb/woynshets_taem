import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future<History> futureHistory;
  @override
  void initState() {
    super.initState();
    futureHistory = getNotification();
  }

  DateFormat format = DateFormat("dd.MM.yyyy");

  Future<History> getNotification() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmluY2lwYWwiOiIxMzc2NDUwIiwic3lzdGVtIjoibHVjeSIsImdyb3VwIjoiYnVzaW5lc3MiLCJ1c2VybmFtZSI6IjEzNzY0NTAiLCJjaGFpbiI6WyJwYXNzd29yZCJdLCJpYXQiOjE2MzY3Nzk3MzksImV4cCI6MTYzNjg2NjEzOX0.5pFTTybH-edlhMms8_AbWPruQPwmBwxAVsU_QMBI4Xs'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api-et.hellocash.net/invoices/VWH235HRKXR3YJD73STO9O944KGW64DF'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final resStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      print(resStr);
      return History.fromJson(jsonDecode(resStr));
      // return History.fromJson(
      //     jsonDecode(await response.stream.bytesToString()));
    } else {
      throw Exception('Failed to load ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  "Your Activity",
                  style: TextStyle(
                      fontFamily: "Overlock",
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              //     IconButton(
              //         icon: Icon(Icons.history),
              //         onPressed: () {
              //           getNotification();
              //         })
              //   ],
              // ),
            ],
          ),
          FutureBuilder<History>(
            future: futureHistory,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text("${snapshot.data.amount}"),
                    Text("${snapshot.data.id}"),
                    Text("${snapshot.data.status}"),
                    Text("${snapshot.data.code}"),
                    Text("${snapshot.data.expires}"),
                    Text("${snapshot.data.date}"),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error} error is occurred in the ui');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ]));
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
