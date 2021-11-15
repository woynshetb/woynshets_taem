import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/search_box.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/home/components/prduct_detail.dart';
import 'catagories.dart';
import 'package:http/http.dart' as http;

class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  fetchProduct(String value) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      if (items['name'] == value) {
        return items;
      }
      return null;
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20),
        children: [
          SearchBox(
            // search by product title from product database

            onChanged: (value) {
              Card(
                child: FutureBuilder(
                    future: fetchProduct(value),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
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
                        return Center(child: CircularProgressIndicator());
                    }),
              );
            },
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: kPrimaryColor,
            labelColor: Colors.black,
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45),
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Text(
                  "Pre-prepared sauce \n የተዘጋጁ ድልሆች",
                  style: TextStyle(fontFamily: "Chiret"),
                ),
              ),
              Tab(
                child: Text(
                  "Traditional wots\n ባህላዊ ወጦች",
                  style: TextStyle(fontFamily: "Chiret"),
                ),
              ),
              Tab(
                child: Text(
                  "Traditional Beverages\n ባህላዊ መጠጦች",
                  style: TextStyle(fontFamily: "Chiret"),
                ),
              ),
              Tab(
                child: Text(
                  "Breads and Injera \n ዳቦ እና እንጀራ",
                  style: TextStyle(fontFamily: "Chiret"),
                ),
              ),
            ],
          ),
          Container(
            // height to be edited
            height: MediaQuery.of(context).size.height - 40,

            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                // can change the screen
                ProductCatagoryPage(),
                ProductCatagoryPage(),
                ProductCatagoryPage(),
                ProductCatagoryPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCard({
  int id,
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