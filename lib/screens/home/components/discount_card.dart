import 'package:flutter/material.dart';

import 'package:woynshet_taem/constants.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Offers & Discounts",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/mitmita.jpg"),
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF961F).withOpacity(0.7),
                    kPrimaryColor.withOpacity(0.1),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset("assets/images/mitmita.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "Get Discount of \n",
                                style: TextStyle(fontSize: 16),
                              ),
                              TextSpan(
                                text: "30% \n",
                                style: TextStyle(
                                  fontSize: 43,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "at Yewoynshet Taste & Instant cashback",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
