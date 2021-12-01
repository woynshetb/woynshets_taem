import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleResponse with ChangeNotifier {
  List<History> single = [];

  addHistory({String status, String reference, String expires}) async {
    print("in get provider ");
    single.add(History(status: status, reference: reference, expires: expires));
    notifyListeners();
  }

  notifyListeners();
}

class History {
  final String reference;

  final String status;
  final String expires;

  History({this.reference, this.status, this.expires});

  // factory History.fromJson(Map<String, dynamic> json) {
  //   return History(
  //     reference: json['reference'],
  //     status: json['status'],
  //     expires: json['expires'],
  //   );
  // }
}
