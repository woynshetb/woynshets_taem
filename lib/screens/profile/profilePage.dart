import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:http/http.dart' as http;

// call this page after authentication
class ProfileScreenPage extends StatefulWidget {
  final String userId;
  ProfileScreenPage({this.userId});

  @override
  _ProfileScreenPageState createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  // function that authenticate if the user is a member or a guest  user

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  // get email by decoding with base 64
  fetchUser() async {
    final response = await http.get(
      Uri.parse(
          'https://woynshetstaem.herokuapp.com/profileinfo/yared@gmail.com'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var items = json.decode(response.body);

      print('productS=================: $items.');

      return items;
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                ProfilePic(),
                SizedBox(
                  height: 30,
                ),
                ProfileMenu(
                  text: snapshot.data['full_name'],
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 20,
                ),
                // pass user id to get cart information by userid
                ProfileMenu(
                  text: snapshot.data['mobile'],
                  icon: Icons.phone,
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileMenu(
                  text: snapshot.data['email'],
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        });
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
      height: 200,
      width: 200,
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
