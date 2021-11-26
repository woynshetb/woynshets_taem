import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/home/components/prduct_detail.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  void initState() {
    super.initState();
    fetchDataLocally();
  }

  fetchDataLocally() async {
    var data = await service.rootBundle.loadString('assets/images/db.json');
    return jsonDecode(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: fetchDataLocally(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [Text(snapshot.data[index]['title'])],
                    );
                  });
            } else
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              ));
          }),
    );
  }
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
