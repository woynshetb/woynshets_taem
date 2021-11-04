import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EcommerceApp {
  static SharedPreferences sharedPreferences;
  static User user;
  static FirebaseAuth auth;
  // static firestore firestore
  static const String appName = 'e-food';

  static final String collectionUser = 'users';
  static final String collectionOrders = 'orders';
  static final String userCartList = 'userCart';
  static final String subCollectionAddress = 'userAddress';

  static final String userName = 'name';
  static final String userEmail = 'email';
  static final String userPhotoUrl = 'photoUrl';
  static final String userId = 'uid';
  static final String userAvatarUrl = 'url';

  static final String addressID = 'addressID';
  static final String totalAmount = 'totalAmount';
  static final String productId = 'productIDs';
  static final String paymentDetails = 'paymentDetails';
  static final String orderTime = 'orderTime';
  static final String isSuccess = 'isSuccess';
}
