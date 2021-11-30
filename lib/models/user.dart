import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Authz { User, Guest }

class AccountType extends ChangeNotifier {
  Authz type;
  String email;
  String phoneNumber;

  List userInfo = [];
  List guesInfo = [];

  var value;
  void auth(value, String factor) {
    if (value == Authz.User) {
      email = factor;
      type = Authz.User;
    } else {
      phoneNumber = factor;
      type = Authz.Guest;
    }
  }
}

class User {
  String name;
  String email;
  String phoneNumber;
  String type = "Regular User";
  User(this.name, this.email, this.phoneNumber);
}

class Guest {
  String id;
  String phoneNumber;
  String type = "Guest User";
}
