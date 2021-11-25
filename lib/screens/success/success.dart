import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:woynshet_taem/models/response.dart';
import 'package:woynshet_taem/screens/home/home-screen.dart';
import 'package:woynshet_taem/size_config.dart';

class Success extends StatelessWidget {
  final Future<Helo> futureHistory;
  Success({this.futureHistory});

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      body: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder<Helo>(
          future: futureHistory,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Image.asset(
                  "assets/images/purchase.png",
                  height: SizeConfig.screenHeight * 0.25,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Congratulations",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(30),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "Overlock"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "You Bill has been created Please Complete Your Payment at Lucy , Walya or Axum HelloCash agent or bank \n Check *912# or call 8807 for more Information ",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: Container(
                            width: 120,
                            margin: const EdgeInsets.all(7.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffFFAC38), width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: SelectableText(
                              snapshot.data.reference,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.white),
                            child: Text('Reference Id '),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Clipboard.setData(
                            new ClipboardData(text: snapshot.data.reference));
                        key.currentState.showSnackBar(new SnackBar(
                          content:
                              new Text("Reference is  Copied to Clipboard"),
                        ));
                      },
                      textColor: Colors.white,
                      color: Color(0xfff063057),
                      padding: const EdgeInsets.all(15.0),
                      child: Text("copy rreference id"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    RaisedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, HomeScreen.routeName),
                      textColor: Colors.white,
                      color: Color(0xfff063057),
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Go home"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: viewMoreButtons(
                      "View Transaction Details",
                      () => {
                            showPowerBottomSheet(
                              context,
                              snapshot.data.expires,
                              snapshot.data.reference,
                              snapshot.data.status,
                            )
                          }),
                ))
              ]);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
    ;
  }
}

showPowerBottomSheet(BuildContext context, String expires, String reference,
        String status) =>
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: 600,
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  )),
              child: Column(
                children: <Widget>[
                  viewMoreButtons(
                      "Close Transaction", () => {Navigator.pop(context)}),
                  SizedBox(height: 10),
                  listItemContainer("Total", "1500"),
                  listItemContainer("Date of Transaction", "today"),
                  listItemContainer("expires", expires),
                  listItemContainer("Transaction References", reference),
                  listItemContainer("Status", status),
                  listItemContainer("Account Type", "Guest"),
                ],
              ),
            ),
          );
        });

MaterialButton viewMoreButtons(String title, Function fun) {
  return MaterialButton(
    onPressed: fun,
    textColor: Colors.white,
    color: const Color(0xffFFAC38),
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 55,
    minWidth: 700,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  );
}

Widget listItemContainer(String title, String value) => Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(196, 196, 196, 1)),
          ),
          SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
        ],
      ),
      decoration: BoxDecoration(
          border: new Border(
              bottom: new BorderSide(width: 1.0, color: Color(0xffC4C4C4)))),
    );
