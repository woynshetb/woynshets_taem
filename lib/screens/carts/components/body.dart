import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Body extends StatefulWidget {
  final String title, imagePath, shopeName;
  final int price;

  const Body({Key key, this.title, this.imagePath, this.shopeName, this.price})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Cart> cart = [];

  // add funtion to pass information and add to the list
  @override
  void initState() {
    cart.add(Cart(
      imagePath: widget.imagePath,
      price: widget.price,
      shopeName: widget.shopeName,
      title: widget.title,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: cart.map((carts) {
            return Slidable(
              key: Key(carts.title),
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.15,
              actions: [],
              child: Card(
                child: ListTile(
                  title: Text(carts.title),
                  subtitle: Text(carts.price.toString()),
                ),
              ),
              secondaryActions: [
                //action button to show on tail
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  child: Icon(Icons.delete),
                  onPressed: () {
                    //delete action for this button
                    cart.removeWhere((element) {
                      return element.title == carts.title;
                    }); //go through the loop and match content to delete from list
                    setState(() {
                      //refresh UI after deleting element from list
                    });
                  },
                ),

                //add more action buttons here.
              ],
            );
          }).toList(),
        ),
      ),
    ));
  }
}

class Cart {
  String title, imagePath, shopeName;
  int price;
  Cart({this.imagePath, this.price, this.shopeName, this.title});
}
