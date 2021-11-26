import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:woynshet_taem/constants.dart';

class Notifications extends StatefulWidget {
  final String value;

  const Notifications({Key key, this.value}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future<History> futureHistory;
  @override
  void initState() {
    super.initState();
    futureHistory = getNotification(widget.value.toString());
  }

  DateFormat format = DateFormat("dd.MM.yyyy");

  Future<History> getNotification(String id) async {
    var headers = {'Content-Type': 'application/json'};
    var req = http.Request(
        'GET', Uri.parse('https://woynshetstaem.herokuapp.com/orders/$id'));
    req.headers.addAll(headers);
    var streamedResponse = await req.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);

      print(decode['response']);
      return History.fromJson(decode['response']);
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
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Summary About Your Order  ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: "Overlock",
                  fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<History>(
            future: futureHistory,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                        title: Text("id"),
                        trailing: Text("${snapshot.data.id}")),
                    ListTile(
                        title: Text("code"),
                        trailing: Text("${snapshot.data.code}")),
                    ListTile(
                        title: Text("date"),
                        trailing: Text("${snapshot.data.date}")),
                    ListTile(
                        title: Text("expires"),
                        trailing: Text("${snapshot.data.expires}")),
                    ListTile(
                        title: Text("from"),
                        trailing: Text("${snapshot.data.from}")),
                    ListTile(
                        title: Text("to"),
                        trailing: Text("${snapshot.data.toname}")),
                    ListTile(
                        title: Text("amount"),
                        trailing: Text("${snapshot.data.amount}")),
                    ListTile(
                        title: Text("description"),
                        trailing: Text("${snapshot.data.description}")),
                    ListTile(
                        title: Text("status"),
                        trailing: Text("${snapshot.data.status}")),
                    ListTile(
                        title: Text("tracenumber"),
                        trailing: Text("${snapshot.data.tracenumber}")),

                    //tracenumber
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error} error is occurred in the ui');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              );
            },
          ),
        ]));
  }
}

class History {
  final String id;
  final String code;
  final String date;
  final String expires;
  final String from;
  final String toname;
  final String description;
  final String tracenumber;
  final num amount;
  final String status;

  History({
    this.code,
    this.toname,
    this.description,
    this.expires,
    this.tracenumber,
    this.date,
    this.from,
    this.id,
    this.amount,
    this.status,
  });
  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      status: json['status'],
      amount: json['amount'],
      id: json['id'],
      from: json['from'],
      date: json['date'],
      tracenumber: json['tracenumber'],
      expires: json['expires'],
      description: json['description'],
      toname: json['toname'],
      code: json['code'],
    );
  }
}
