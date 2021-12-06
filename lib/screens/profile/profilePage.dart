import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/providers/auth.dart';

import 'package:woynshet_taem/screens/home/home-screen.dart';

class ProfileScreenPage extends StatefulWidget {
  final String username;
  final String useremail;
  final String userPhonenumber;

  ProfileScreenPage({this.username, this.userPhonenumber, this.useremail});

  @override
  _ProfileScreenPageState createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        ProfilePic(),
        SizedBox(
          height: 10,
        ),
        ProfileMenu(
          text: widget.username,
          icon: Icons.person,
        ),
        SizedBox(
          height: 10,
        ),
        ProfileMenu(
          text: widget.userPhonenumber,
          icon: Icons.phone,
        ),
        SizedBox(
          height: 10,
        ),
        ProfileMenu(
          text: widget.useremail,
          icon: Icons.email,
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }),
              IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    Consumer<Auth>(
                      builder: (context, auth, child) => auth.logout(),
                    );
                  })
            ],
          ),
        ),
      ],
    ));
  }
}

class ProfileMenu extends StatelessWidget {
  final String text;
  final IconData icon;

  const ProfileMenu({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        padding: EdgeInsets.only(left: 43),
        height: 60,
        decoration: BoxDecoration(
            color: Color(0xfff5f6f9), borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              icon,
              size: 26,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            // IconButton(
            //     icon: Icon(
            //       icon,
            //       color: Color(0xfff5f6f9),
            //     ),
            //     onPressed: () {})
          ],
        ),
      ),
    );
  }
}

// this is the circle avatar for profile page
class ProfilePic extends StatelessWidget {
  // get user id and if uid is member image should be replaced by profile image
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profilee.png"),
          ),
          Positioned(
            bottom: 0,
            right: -12,
            child: SizedBox(
              height: 35,
              width: 55,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: () {
                  // on pressed change picture edit picture
                },
                child: Icon(
                  Icons.camera_enhance,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
