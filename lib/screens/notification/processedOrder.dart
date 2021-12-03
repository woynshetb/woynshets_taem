import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:woynshet_taem/providers/auth.dart';
import 'package:woynshet_taem/screens/notification/orderDetail.dart';

class Processed extends StatefulWidget {
  @override
  _ProcessedState createState() => _ProcessedState();
}

fetchHistory(String number) async {
  final response = await http.get(Uri.parse(
      'https://woynshetstaem.herokuapp.com/orders/processed/$number'));

  if (response.statusCode == 200) {
    var products = json.decode(response.body);
    var allOrders = products['avialableProduct'];

    print('productS=================: $allOrders.');

    return allOrders;
  } else {
    print("error");
  }
}

class _ProcessedState extends State<Processed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: fetchHistory(Provider.of<Auth>(context).user[0].phoneNumber),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return _buildCard(
                        id: snapshot.data[index]['orderId'],
                        list: snapshot.data[index]['productsId'],
                        payment: snapshot.data[index]['payWith'],
                        price: snapshot.data[index]['totalPrice'],
                        orderedDate: snapshot.data[index]['createdAt'],
                        expires: snapshot.data[index]['expires'],
                        status: snapshot.data[index]['status'],
                        context: context);
                  });
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}

Widget _buildCard({
  String id,
  String payment,
  num price,
  List list,
  String orderedDate,
  String expires,
  String status,
  context,
}) {
  return Padding(
    padding: EdgeInsets.only(top: 5, bottom: 1, left: 5, right: 5),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OrderDetail(
                  expires: expires,
                  payment: payment,
                  price: price,
                  list: list,
                  orderedDate: orderedDate,
                  orderId: id,
                  status: status,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white),
        child: Column(
          children: [
            ListTile(
              leading: Text(
                  "Date $orderedDate You have \n Ordered ${list.length + 1} Products  Click to see more "),
              trailing: Text(
                " Total Price =  ${price} Birr",
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
