import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/notification/history.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "የወይንሸት",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Kiros",
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "ጣዕም",
                  style: TextStyle(
                      fontSize: 60,
                      fontFamily: "Kiros",
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Enter Your Reference Code to see information About Your Order  ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Overlock",
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: kSecondaryColor.withOpacity(0.32),
                  )),
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Enter Reference Here",
                  hintStyle: TextStyle(color: kSecondaryColor),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DefaultButton(
              text: "search",
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Notifications(
                              value: search.text,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
