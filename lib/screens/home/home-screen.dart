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
import 'package:ussd_service/ussd_service.dart';
import 'package:sim_data/sim_data.dart';

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

  subscriptionId() async {
    try {
      SimData simData = await SimDataPlugin.getSimData();

      print(simData);
    } catch (err) {
      throw err;
    }
  }

  makeMyRequest() async {
    int subscriptionId = 1;
    String code = "*912#";
    try {
      String ussdResonseMessage = await UssdService.makeRequest(
          subscriptionId, code, Duration(seconds: 10));
      print(ussdResonseMessage);
    } catch (err) {
      debugPrint(err);
    }
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
        TextButton(
          onPressed: () {},
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                color: Color(0xfff5f6f9),
                borderRadius: BorderRadius.circular(15)),
            child: Container(
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                title: Provider.of<Auth>(context).user.isEmpty
                    ? Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )
                    : Text(
                        Provider.of<Auth>(context).user[0].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OrderHistory();
            }));
          },
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                color: Color(0xfff5f6f9),
                borderRadius: BorderRadius.circular(15)),
            child: Container(
              child: ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: kPrimaryColor,
                ),
                title: Text(
                  "Order History",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {
            subscriptionId();
          },
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                color: Color(0xfff5f6f9),
                borderRadius: BorderRadius.circular(15)),
            child: Container(
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: kPrimaryColor,
                ),
                title: Text(
                  "Setting",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OrderHistory();
            }));
          },
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                color: Color(0xfff5f6f9),
                borderRadius: BorderRadius.circular(15)),
            child: Container(
              child: ListTile(
                leading: Icon(
                  Icons.help,
                  color: kPrimaryColor,
                ),
                title: Text(
                  "Customer Service",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
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
