import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import './item.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  num price = 0.0;
  void add(Item item) {
    _items.add(item);
    price += item.price;
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    price -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  num get totalPrice {
    return price;
  }

  List<Item> get basketitem {
    return _items;
  }
}
