import 'package:flutter/material.dart';

import 'package:woynshet_taem/constants.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key key,
    @required this.size,
    this.press,
  }) : super(key: key);

  final Size size;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10),
                  Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
