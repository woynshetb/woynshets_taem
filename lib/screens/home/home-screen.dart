import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/authenticate/auth.dart';

import 'package:woynshet_taem/screens/carts/cart_screen.dart';
import 'package:woynshet_taem/screens/home/components/app_bar.dart';
import 'package:woynshet_taem/screens/home/components/body.dart';
import 'package:woynshet_taem/screens/notification/orderHistory.dart';
import 'package:woynshet_taem/screens/profile/profilePage.dart';
import '../../providers/auth.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    NewHome(),
    CartScreen(),
    Consumer<Auth>(
      builder: (context, auth, child) {
        return auth.user.length != 0
            ? ProfileScreenPage(
                username: auth.user[0].name,
                userPhonenumber: auth.user[0].phoneNumber,
                useremail: auth.user[0].email)
            : Authen();
      },
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      // implement drawer
      drawer: Drawer(
          child: ListView(children: [
        DrawerHeader(
          child: CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage("assets/images/profilee.png"),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Provider.of<Auth>(context).user.isEmpty
              ? null
              : Text(Provider.of<Auth>(context).user[0].name),
        ),
        Container(
          padding: EdgeInsets.only(left: 43),
          height: 35,
          decoration: BoxDecoration(
              color: Color(0xfff5f6f9),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OrderHistory();
                  }));
                },
                icon: Icon(
                  Icons.notifications,
                  size: 26,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: Text(
                  "Order History",
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
        SizedBox(
          height: 20,
        ),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
