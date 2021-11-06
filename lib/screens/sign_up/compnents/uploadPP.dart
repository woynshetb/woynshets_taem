import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:woynshet_taem/components/default_button.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController locationController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  File file;
  final imagePicker = ImagePicker();
  bool isUploading = false;
  XFile _imageFileList;
  _imageFile(XFile value) {
    _imageFileList = value == null ? null : value;
  }

  handleTakeImage() async {
    Navigator.pop(context);
    final image = await imagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 675, maxWidth: 960);
    setState(() {
      _imageFile(image);
    });
  }

  handleChooseFromGallary() async {
    Navigator.pop(context);
    final image = await imagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 675, maxWidth: 960);
    setState(() {
      _imageFile(image);
    });
  }

  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("Post Image"),
            children: [
              SimpleDialogOption(
                child: Text("Take an Image from Camera"),
                onPressed: handleTakeImage,
              ),
              SimpleDialogOption(
                child: Text("Select from Gallary"),
                onPressed: handleChooseFromGallary,
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Container buildCircleAvatar() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          CircleAvatar(
            radius: 120,
            backgroundImage: FileImage(File(_imageFileList.path)),
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 70,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              print("clicked");
            },
          )
        ],
      ),
    );
  }

  Container buildSplashScreen() {
    return Container(
      //  color: Theme.of(context).accentColor.withOpacity(0.6),
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          // CircleAvatar(
          //   child: _imageFileList == null
          //       ? Icon(Icons.person)
          //       : Image.file(
          //           File(_imageFileList.path),
          //         ),
          // ),
          Image.asset(
            "assets/images/profilee.png",
            height: 260.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
              child: Text(
                "Upload Profile Picture",
                style: TextStyle(fontSize: 22.0, color: Colors.orange),
              ),
              onPressed: () {
                selectImage(context);
              },
            ),
          ),
          // Image.file(
          //   File(_imageFileList.path),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _imageFileList == null ? buildSplashScreen() : buildCircleAvatar();
  }
}
