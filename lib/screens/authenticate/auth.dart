import 'package:flutter/material.dart';

import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/accounts/guestAccount.dart';
import 'package:woynshet_taem/screens/payment/guestpayment.dart';

import 'package:woynshet_taem/screens/sign_in/sign_in_screen.dart';
import 'package:woynshet_taem/screens/sign_up/sign_up_screen.dart';

class Auth extends StatefulWidget {
  final num totalPrice;

  const Auth({this.totalPrice});

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          SizedBox(
            height: 70,
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
              "Sign in to your account to checkout  ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Overlock",
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 40,
          ),

          CustomGesture(
            text: "Already member ? Login",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
              // Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),

          SizedBox(
            height: 20,
          ),
          CustomGesture(
            text: "New to የወይንሸት ጣዕም ? SignUp",
            press: () {
              Navigator.pushNamed(context, SignUpScreen.routeName);
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomGesture(
            text: "Guest Checkout",
            press: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => Payment(
              //               title: widget.productName,
              //               amount: widget.productPrice,
              //             )));

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GuestAccount(
                            total: widget.totalPrice,
                          )));
            },
          ),
          //
        ]));
  }
}

class CustomGesture extends StatelessWidget {
  final String text;
  final Function press;

  const CustomGesture({Key key, this.text, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          width: 300,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.orange[300], Colors.orange[300]],
              )),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ));
  }
}
