import 'package:cloud_firestore/cloud_firestore.dart';
import 'Config/config.dart';
import 'Store/storehome.dart';
import 'Widgets/loadingWidget.dart';
import 'Widgets/orderCard.dart';
import 'Models/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String getOrderId = "";

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}

class StatusBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PaymentDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ShippingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

class KeyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}
