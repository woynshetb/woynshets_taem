import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: Column(
        children: [
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
              IconButton(icon: Icon(Icons.history), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}
