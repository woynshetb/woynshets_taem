import 'package:flutter/material.dart';
import 'package:woynshet_taem/components/search_box.dart';
import 'package:woynshet_taem/constants.dart';
import './catagories.dart';

class NewHome extends StatefulWidget {
  static String routeName = "/home";
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20),
        children: [
          SearchBox(
            // search by product title from product database
            onChanged: (value) {},
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: kPrimaryColor,
            labelColor: Colors.black,
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45),
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Text(
                  "Pre-prepared sauce \n የተዘጋጁ ድልሆች",
                  style: TextStyle(fontFamily: "Chiret"),
                ),
              ),
              Tab(
                child: Text(
                  "Traditional wots\n ባህላዊ ወጦች",
                  style: TextStyle(fontFamily: "Chiret"),
                ),
              ),
              Tab(
                child: Text(
                  "Traditional Beverages\n ባህላዊ መጠጦች",
                  style: TextStyle(fontFamily: "Chiret"),
                ),
              ),
              Tab(
                child: Text(
                  "Breads and Injera \n ዳቦ እና እንጀራ",
                  style: TextStyle(fontFamily: "Chiret"),
                ),
              ),
            ],
          ),
          Container(
            // height to be edited
            height: MediaQuery.of(context).size.height - 40,

            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                ProductCatagoryPage(),
                ProductCatagoryPage(),
                ProductCatagoryPage(),
                ProductCatagoryPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
