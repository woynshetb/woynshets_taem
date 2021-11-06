import 'package:flutter/material.dart';
import 'package:woynshet_taem/Widgets/customTextField.dart';
import 'package:woynshet_taem/components/default_button.dart';

import 'package:image_picker/image_picker.dart';
import 'package:woynshet_taem/screens/sign_up/compnents/uploadPP.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Upload(),
    ]));
  }
}
