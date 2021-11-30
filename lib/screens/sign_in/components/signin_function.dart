import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woynshet_taem/components/default_button.dart';
import 'package:http/http.dart' as http;
import 'package:woynshet_taem/providers/auth.dart';
import 'package:woynshet_taem/screens/authenticate/auth.dart';
import 'package:woynshet_taem/screens/profile/profilePage.dart';
import 'package:woynshet_taem/size_config.dart';

//function to autenticate existing member and if the user is a member go to home
class SignInFunc extends StatefulWidget {
  final String email;
  final String password;
  SignInFunc({this.email, this.password});

  @override
  _SignInFuncState createState() => _SignInFuncState();
}

// function to authenticate
signIn(String email, String password) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('https://woynshetstaem.herokuapp.com/signin'));

  request.body = json.encode({
    "email": email,
    "password": password,
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var decode = jsonDecode(request.body);
    print(await response.stream.bytesToString());
    print("user have authenticated email ");
    // search user in profile collection in database and get information for profile information
    print(decode["email"]);
  } else {
    print(response.reasonPhrase);
  }
}

class _SignInFuncState extends State<SignInFunc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Is that Your Correct Credential ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Overlock"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Email :",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Kiros",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Kiros",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Password : ",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Kiros",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      widget.password,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Kiros",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                DefaultButton(
                  text: "Yes",
                  press: () async {
                    print("whyy");
                    await signIn(widget.email, widget.password);
                    print("whyy");
                    // Navigator.pushNamed(context, LoginSuccessScreen.routeName);

                    // pass id

                    print("whyy");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ProfileScreenPage(
                    //               widget.email,
                    //             )));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Consumer<Auth>(
                    builder: (context, func, child) {
                      return DefaultButton(
                        text: "using auth",
                        press: () async {
                          await func.signIn(widget.email, widget.password);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Consumer<Auth>(
                                        builder: (context, auth, child) {
                                          return auth.user.length != 0
                                              ? ProfileScreenPage(
                                                  username: auth.user[0].name,
                                                  userPhonenumber:
                                                      auth.user[0].phoneNumber,
                                                  useremail: auth.user[0].email)
                                              : Authen();
                                        },
                                      )));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
