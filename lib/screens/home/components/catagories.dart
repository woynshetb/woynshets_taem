import 'package:flutter/material.dart';
import './prduct_detail.dart';

class ProductCatagoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfffcfaf8),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 70.0,
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: [
                _buildCard(
                    "Less Spicy Chill | በርበሬ",
                    "well prepared chill powder for raw meet and fish",
                    50,
                    "Chills Powder",
                    "Aberash Company",
                    "assets/images/mitmita.jpg",
                    false,
                    false,
                    context),
                _buildCard(
                    " Tin layer Bread | እንጀራ",
                    "a nice enjera to eat with different souce",
                    15,
                    "enjera",
                    "Kalkian Company",
                    "assets/images/enjera.jpg",
                    false,
                    false,
                    context),
                _buildCard(
                    "Less Spicy Chill \n      በርበሬ",
                    "well prepared chill powder for raw meet and fish",
                    60,
                    "Chills Powder",
                    "Aberash Company",
                    "assets/images/mitmita.jpg",
                    false,
                    false,
                    context),
                _buildCard(
                    "Less Spicy Chill \n በርበሬ",
                    "well prepared chill powder for raw meet and fish",
                    60,
                    "Chills Powder",
                    "Aberash Company",
                    "assets/images/mitmita.jpg",
                    false,
                    false,
                    context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    String title,
    String desc,
    int price,
    String cat,
    String shopeName,
    String imgPath,
    bool added,
    isFavorite,
    context,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
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
                    image: AssetImage(
                      imgPath,
                    ),
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
