import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:woynshet_taem/screens/home/components/prduct_detail.dart';

class Hey extends StatefulWidget {
  @override
  State<Hey> createState() => _HeyState();
}

class _HeyState extends State<Hey> {
  // List user = [];
  // bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchProduct();
  }

  fetchProduct() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      return items;
      // setState(() {
      //   user = items;
      //   print(user);
      // });
    } else {
      // setState(() {
      //   user = [];
      // });
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfffcfaf8),
        body: Container(
          padding: EdgeInsets.only(right: 15.0),
          width: MediaQuery.of(context).size.width - 30.0,
          height: MediaQuery.of(context).size.height - 70.0,
          child: FutureBuilder(
              future: fetchProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return _buildCard(
                            id: snapshot.data[index]['id'],
                            title: snapshot.data[index]['title'],
                            desc: snapshot.data[index]['description'],
                            price: snapshot.data[index]['price'],
                            cat: snapshot.data[index]['category'],
                            shopeName: "zenebech baltna",
                            imgPath: snapshot.data[index]['image'],
                            isFavorite: false,
                            added: false,
                            context: context);
                      });
                } else
                  return CircularProgressIndicator();
              }),
        ));
  }

  Widget _buildCard({
    int id,
    String title,
    String desc,
    double price,
    String cat,
    String shopeName,
    String imgPath,
    bool added,
    isFavorite,
    context,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 1, left: 5, right: 5),
      child: InkWell(
        onTap: () {
          // this is how you route b/n pages ( screen) without named route
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDet(
                    assetPath: imgPath,
                    productPrice: price,
                    productTitle: title,
                    catagory: cat,
                    produtDesc: desc,
                    shopeName: shopeName,
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
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? Icon(Icons.favorite, color: Color(0xffef7532))
                        : Icon(
                            Icons.favorite_border,
                            color: Color(0xffef7532),
                          ),
                  ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(imgPath),
                    fit: BoxFit.contain,
                  )),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              /////
              Text(title,
                  style: TextStyle(
                    color: Color(0xffcc8053),
                    fontFamily: "Overlock",
                    fontSize: 14,
                  )),
              Text(
                " ${price} Birr",
                style: TextStyle(
                  color: Color(0xff575e67),
                  fontFamily: "Overlock",
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  color: Colors.orange,
                  height: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      Text(
                        "See more ...",
                        style:
                            TextStyle(color: Color(0xffd17e50), fontSize: 12.0),
                      ),
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
