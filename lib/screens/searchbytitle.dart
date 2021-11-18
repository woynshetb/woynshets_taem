import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:woynshet_taem/screens/home/components/prduct_detail.dart';

class Search extends StatefulWidget {
  final String value;

  Search({this.value});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
    } else {
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
          width: MediaQuery.of(context).size.width - 10.0,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
              future: fetchProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final recent = snapshot.data.map((e) => e['title']);

                  final suggestionList = widget.value.isEmpty
                      ? recent.toList()
                      : recent
                          .toList()
                          .where((element) =>
                              element.startsWith(widget.value) as bool)
                          .toList();

                  return ListView.builder(
                      itemCount: suggestionList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            // Navigator.pop(context);
                          },
                          title: RichText(
                              text: TextSpan(
                                  text: suggestionList[index]
                                      .substring(0, widget.value.length),
                                  style: TextStyle(
                                      color: Colors.brown,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                    text: suggestionList[index]
                                        .substring(widget.value.length),
                                    style: TextStyle(
                                      color: Colors.green[200],
                                    ))
                              ])),
                          leading: Icon(Icons.list),
                        );
                        // return _buildCard(
                        //     id: snapshot.data[index]['id'],
                        //     title: snapshot.data[index]['title'],
                        //     desc: snapshot.data[index]['description'],
                        //     price: snapshot.data[index]['price'],
                        //     cat: snapshot.data[index]['category'],
                        //     shopeName: "zenebech baltna",
                        //     imgPath: snapshot.data[index]['image'],
                        //     isFavorite: false,
                        //     added: false,
                        //     context: context);
                      });
                } else
                  return Center(child: CircularProgressIndicator());
              }),
        ));
  }

  Widget _buildCard({
    num id,
    String title,
    String desc,
    num price,
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
                    productId: id,
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
              SizedBox(
                height: 15,
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(imgPath),
                    fit: BoxFit.contain,
                  )),
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              /////
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffcc8053),
                    fontFamily: "Overlock",
                    fontSize: 12,
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
                        "see more",
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
