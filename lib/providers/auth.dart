import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  List<User> user = [];
  String _token;
  DateTime _expireDate;
  String userEmail;
  bool get isAth {
    return token != null;
  }

  String get token {
    if (_expireDate != null &&
        _expireDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(String email, String password) async {
    var url = Uri.parse('https://woynshetstaem.herokuapp.com/signin');
    var response =
        await http.post(url, body: {'email': email, 'password': password});
    try {
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        print(response.body);
        print(decode['token']);
        _token = decode['token'];
        print(_token);
        final responseData = json.decode(response.body);
        getProfile(_token, email);
        print("hello there");
        notifyListeners();
        return _token;
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      throw error;
    }
  }

  signIn(String email, String password) async {
    return _authenticate(
      email,
      password,
    );
  }

  guestCreation(String phoneNumber) async {
    try {
      var url = Uri.parse('https://woynshetstaem.herokuapp.com/guest');
      var response = await http.post(url, body: {
        'phonenumber': "${phoneNumber}",
      });

      if (response.statusCode == 201) {
        print("hello from auth");
        print(response.body);
        var decode = jsonDecode(response.body);
        print(decode);
        user.remove;
        user.add(User(decode['guestId'], "", decode['phonenumber'], "Guest"));

        print(user.length);
        print(user[0].name);
        notifyListeners();
      } else {
        print(response.statusCode);
        notifyListeners();
      }
      notifyListeners();
    } catch (exception) {} finally {}
    notifyListeners();
  }

  getProfile(String _token, String email) async {
    if (_token != null && email != null) {
      final response = await http.get(
        Uri.parse('https://woynshetstaem.herokuapp.com/profileinfo/$email'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var items = json.decode(response.body);
        user.remove;
        user.length == 0
            ? user.add(User(
                items['full_name'], items['email'], items['mobile'], "user"))
            : user.remove;
        print(user.length);
      } else {
        print("error in if ");
      }

      user.remove;
      notifyListeners();
    } else {
      print("print in feetching");
      notifyListeners();
    }
    notifyListeners();
  }

  logout() {
    user.remove;
    notifyListeners();
  }
}

class User {
  String name;

  String email;
  String phoneNumber;
  String type;
  User(this.name, this.email, this.phoneNumber, this.type);
}
