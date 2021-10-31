import 'package:flutter/material.dart';
import 'package:woynshet_taem/screens/carts/cart_screen.dart';

import 'package:woynshet_taem/screens/complete_profile/complete_profile.dart';
import 'package:woynshet_taem/screens/details/details-screen.dart';
import 'package:woynshet_taem/screens/forgot_password/forgot_password.dart';
import 'package:woynshet_taem/screens/home/home-screen.dart';
import 'package:woynshet_taem/screens/login_success/login_success.dart';
import 'package:woynshet_taem/screens/otp/otp_screen.dart';
import 'package:woynshet_taem/screens/sign_in/sign_in_screen.dart';
import 'package:woynshet_taem/screens/sign_up/sign_up_screen.dart';
import 'package:woynshet_taem/screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OTPScreen.routName: (context) => OTPScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
