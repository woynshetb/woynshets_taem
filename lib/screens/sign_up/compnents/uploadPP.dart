import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:woynshet_taem/Widgets/customTextField.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController locationController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController cPasswordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userImageUrl = "";
  File imageFile;
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

  Container buildCircleAvatar(_imageFileList) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: _imageFileList == null
                ? AssetImage("assets/images/profilee.png")
                : FileImage(File(_imageFileList.path)),
            backgroundColor: Colors.white,
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                selectImage(context);
              },
              icon: Icon(Icons.camera_alt_rounded),
              label: Text("Upload Profile Picture")),
        ],
      ),
    );
  }

//  _imageFileList == null ? buildSplashScreen() : buildCircleAvatar();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: 400,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildCircleAvatar(_imageFileList),
            ],
          ),
        ),
      ),
    );
  }
}
