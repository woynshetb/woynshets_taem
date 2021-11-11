import 'dart:convert';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:woynshet_taem/components/default_button.dart';
import './hey.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Album> futureAlbum;
  Future<Product> futureProduct;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureProduct = fetchProduct();
  }

// this calls to api and get data of 1 album
  Future<Album> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/2'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

// function to fetch one data from internet

  Future<Product> fetchProduct() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/2'));

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<String>> hetdata() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products#'));

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("${snapshot.data.price}");
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              FutureBuilder<Product>(
                future: futureProduct,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text("${snapshot.data.id}"),
                        Text("${snapshot.data.title}"),
                        Text("${snapshot.data.catagory}"),
                        Text("${snapshot.data.price.toString()}"),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              DefaultButton(
                text: "continue",
                press: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Hey()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Album {
  final int id;
  final String title;
  final double price;

  Album({this.id, this.title, this.price});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], title: json['title'], price: json['price']);
  }
}

class Product {
  final int id;
  final String title, catagory, description, imagePath;
  final double price;
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
        imagePath: json['image'],
        price: json['price'],
        description: json['description']);
  }
}
