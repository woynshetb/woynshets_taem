import 'package:flutter/material.dart';
import 'package:woynshet_taem/screens/details/details-screen.dart';
import 'package:woynshet_taem/screens/home/components/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chills"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Row(
              children: [
                ItemCard(
                  svgSrc: "assets/images/mitmita.jpg",
                  title: "Less Spicy Chill \n በርበሬ",
                  shopName: "Aberash Company",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen();
                        },
                      ),
                    );
                  },
                ),
                ItemCard(
                  svgSrc: "assets/images/mitmita.jpg",
                  title: "Very Spicy Chill \n ሚጥሚጣ",
                  shopName: "Kaldis Coffie",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                ItemCard(
                  svgSrc: "assets/images/mitmita.jpg",
                  title: "Wet chill for Raw Meet \n የስጋ ዳጣ",
                  shopName: "Tewabech Baltna",
                  press: () {},
                ),
                ItemCard(
                  svgSrc: "assets/images/mitmita.jpg",
                  title: "less spicy wet chill for Fish\n የአሳ ዳጣ ",
                  shopName: "Zenebech Baltna",
                  press: () {},
                )
              ],
            ),
            Row(
              children: [
                ItemCard(
                  svgSrc: "assets/images/mitmita.jpg",
                  title: "Wet chill for Raw Meet \n የስጋ ዳጣ",
                  shopName: "Tewabech Baltna",
                  press: () {},
                ),
                ItemCard(
                  svgSrc: "assets/images/mitmita.jpg",
                  title: "less spicy wet chill for Fish\n የአሳ ዳጣ ",
                  shopName: "Zenebech Baltna",
                  press: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
