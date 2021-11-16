import 'package:flutter/material.dart';
import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/notification/history.dart';

class ProfileScreenPage extends StatefulWidget {
  final String userId;
  ProfileScreenPage({this.userId});

  @override
  _ProfileScreenPageState createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  // function that authenticate if the user is a member or a guest  user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfilePic(),
          SizedBox(
            height: 40,
          ),
          ProfileMenu(
            text: "My Account",
            icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
            press: () {},
          ),
          SizedBox(
            height: 40,
          ),
          // pass user id to get cart information by userid
          ProfileMenu(
            text: "My Cart",
            icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
            press: () {},
          ),
          SizedBox(
            height: 40,
          ),
          ProfileMenu(
            text: "Notificatoon",
            icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
            },
          ),
          SizedBox(
            height: 40,
          ),
          ProfileMenu(
            text: "Setting",
            icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function press;

  const ProfileMenu({Key key, this.text, this.icon, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xfff5f6f9)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.person,
                size: 22,
                color: kPrimaryColor,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              IconButton(icon: icon, onPressed: press)
            ],
          )),
    );
  }
}

class ProfilePic extends StatelessWidget {
  // get user id and if uid is member image should be replaced by profile image
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 160,
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
