import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:woynshet_taem/screens/home/components/prduct_detail.dart';

class SearchById extends StatefulWidget {
  final String value;

  SearchById({this.value});

  @override
  _SearchByIdState createState() => _SearchByIdState();
}

class _SearchByIdState extends State<SearchById> {
  Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct(widget.value);
  }

  Future<Product> fetchProduct(String val) async {
    final response = await http
        .get(Uri.parse('https://woynshetstaem.herokuapp.com/search/$val'));

    if (response.statusCode == 200) {
      print(response.body);
      var items = json.decode(response.body);
      var pro = items['products'];
      print(pro[0]);
      return Product.fromJson(pro[0]);
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Product>(
          future: futureProduct,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // this is how you route b/n pages ( screen) without named route
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDet(
                              productId: snapshot.data.id,
                              assetPath: snapshot.data.imagePath,
                              productPrice: snapshot.data.price,
                              productTitle: snapshot.data.title,
                              catagory: snapshot.data.catagory,
                              produtDesc: snapshot.data.description,
                              shopeName: "Suzy's shop",
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
                          height: 50,
                        ),
                        Row(
                          children: [
                            Text(
                              "የወይንእሸት",
                              style:
                                  TextStyle(fontFamily: "Kiros", fontSize: 25),
                            ),
                            Text(
                              "ጣዕም ",
                              style:
                                  TextStyle(fontFamily: "Kiros", fontSize: 25),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Search Results",
                          style: TextStyle(fontFamily: "Kiros", fontSize: 25),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Hero(
                          tag: snapshot.data.imagePath,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(snapshot.data.imagePath),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        /////
                        Text(snapshot.data.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xffcc8053),
                              fontFamily: "Overlock",
                              fontSize: 25,
                            )),
                        Text(
                          " ${snapshot.data.price} Birr",
                          style: TextStyle(
                            color: Color(0xff575e67),
                            fontFamily: "Overlock",
                            fontSize: 30,
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
                              Text(
                                "Tab to see more information",
                                style: TextStyle(
                                    color: Color(0xffd17e50), fontSize: 12.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class Product {
  final num id;
  final String title, catagory, description, imagePath;
  final num price;
  Product(
      {this.catagory,
      this.description,
      this.id,
      this.imagePath,
      this.price,
      this.title});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        catagory: json['category'],
        imagePath: json['image_url'],
        price: json['price'],
        description: json['description']);
  }
}
