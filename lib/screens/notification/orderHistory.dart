import 'package:flutter/material.dart';

import 'package:woynshet_taem/constants.dart';
import 'package:woynshet_taem/screens/notification/allOrder.dart';

import 'package:woynshet_taem/screens/notification/pendingOrder.dart';
import 'package:woynshet_taem/screens/notification/processedOrder.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                "Your Orders",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: TabBar(
                controller: _tabController,
                indicatorColor: kPrimaryColor,
                labelColor: Colors.black,
                isScrollable: true,
                labelPadding: EdgeInsets.all(20),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text("All ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  Tab(
                    child: Text("Ongoing ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                  Tab(
                    child: Text("Purchased",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            Container(
              // height to be edited
              height: MediaQuery.of(context).size.height - 40,

              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // can change the screen
                  AllOrder(),
                  Pending(),
                  Processed(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
