import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Order with ChangeNotifier {
  List<OrderModel> order = [];
}

class OrderModel {}
