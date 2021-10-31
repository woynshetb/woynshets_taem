import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/components/social_card.dart';
import 'package:woynshet_taem/screens/sign_up/compnents/sign_up_form.dart';
import 'package:woynshet_taem/size_config.dart';

final _formkey = GlobalKey<FormState>();

String email;
String password;
String confirm_password;
final List<String> errors = [];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            Text(
              "Register Account",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Text(
              "Complete your detail or continue \n with social medias",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
            SignUpForm(),
            SizedBox(
              height: SizeConfig.screenHeight * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                  icon: "assets/icons/f.png",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/f.png",
                  press: () {},
                ),
                SocialCard(
                  icon: "assets/icons/f.png",
                  press: () {},
                ),
              ],
            ),
            Text(
              "By continuing your confirm that you agree \nwith our Term and Condition",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
