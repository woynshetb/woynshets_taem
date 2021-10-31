import 'package:flutter/material.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/home/components/category_item.dart';
import 'package:woynshet_taem/screens/home/components/item_list.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [],
          ),
          Cate(
            title: "Pre-prepared sauce \n የተዘጋጁ ድልሆች",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ItemList()));
            },
          ),
          Cate(
            title: "Traditional wots\n ባህላዊ ወጦች",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ItemList()));
            },
          ),
          Cate(
            title: "Traditional Beverages\n ባህላዊ መጠጦች ",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ItemList()));
            },
          ),
          Cate(
            title: "Breads and Injera \n ዳቦ እና እንጀራ",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ItemList()));
            },
          ),
        ],
      ),
    );
  }
}

class Cate extends StatelessWidget {
  const Cate({Key key, this.title, this.press}) : super(key: key);
  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Container(
                    width: 200,
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.13),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("assets/images/mitmita.jpg")),
                Text(title),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
