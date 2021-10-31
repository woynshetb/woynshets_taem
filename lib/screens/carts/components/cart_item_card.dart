import 'package:flutter/material.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/size_config.dart';

class CartitemCard extends StatelessWidget {
  const CartitemCard(
      {Key key, this.img, this.itemNumber, this.price, this.text})
      : super(key: key);

  final int itemNumber;
  final String img;
  final int price;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: getProportionateScreenWidth(88),
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(img)),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                  text: "\n $price",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                      fontSize: 20),
                  children: [
                    TextSpan(
                        text: "x $itemNumber",
                        style: TextStyle(
                          color: kPrimaryColor,
                        )),
                  ]),
            ),
          ],
        )
      ],
    );
  }
}
