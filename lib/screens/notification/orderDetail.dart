import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  final List<dynamic> list;
  final String payment;
  final num price;

  final String orderedDate;
  final String expires;
  final String orderId;
  final String status;

  OrderDetail(
      {this.expires,
      this.list,
      this.orderedDate,
      this.payment,
      this.price,
      this.status,
      this.orderId});

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "የወይንእሸት",
                  style: TextStyle(fontFamily: "Kiros", fontSize: 25),
                ),
                Text(
                  "ጣዕም ",
                  style: TextStyle(fontFamily: "Kiros", fontSize: 25),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Order Summary",
              style: TextStyle(fontFamily: "Kiros", fontSize: 25),
            ),

            SizedBox(
              height: 50,
            ),
            ListTile(
                title: Text("OrderId"), trailing: Text("${widget.orderId}")),
            ListTile(
                title: Text("Payment Method"),
                trailing: Text("${widget.payment}")),
            ListTile(
                title: Text("Total Price"),
                trailing: Text("${widget.price.toString()} ETB")),
            ListTile(
                title: Text("Ordered Date"),
                trailing: Text("${widget.orderedDate}")),
            ListTile(
                title: Text("Expires"), trailing: Text("${widget.expires}")),
            ListTile(title: Text("Status"), trailing: Text("${widget.status}")),

            // CustomList(
            //   list: widget.list,
            // )
          ]),
        ),
      ),
    );
  }
}

// product fetching
// class CustomList extends StatelessWidget {
//   final List<dynamic> list;

//   CustomList({Key key, this.list});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: list.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text("product"),
//           );
//         });
//   }
// }
