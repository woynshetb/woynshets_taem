import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:woynshet_taem/Widgets/customTextField.dart';
import 'package:woynshet_taem/components/default_button.dart';
import './form.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController mobileTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController cPasswordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String pass;
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
            radius: 80,
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildCircleAvatar(_imageFileList),
            Text(
              _imageFileList == null ? "no file" : _imageFileList.path,
              style: TextStyle(fontSize: 5),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeTextField(
                    controller: nameTextEditingController,
                    data: Icons.person,
                    isObsecure: false,
                    hintText: "Enter Full name",
                    val: (controller) {
                      if (controller == null || controller.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  CustomeTextField(
                    controller: emailTextEditingController,
                    data: Icons.mail,
                    isObsecure: false,
                    hintText: "Enter Your email",
                    val: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter  email';
                      }
                      return null;
                    },
                  ),
                  CustomeTextField(
                    controller: mobileTextEditingController,
                    data: Icons.phone,
                    isObsecure: false,
                    hintText: "Phone in Standard form",
                    val: (controller) {
                      if (controller == null || controller.isEmpty) {
                        return 'Please enter phone';
                      }
                      return null;
                    },
                  ),
                  CustomeTextField(
                    controller: passwordTextEditingController,
                    data: Icons.lock,
                    isObsecure: true,
                    hintText: "Enter password",
                  ),
                  CustomeTextField(
                      controller: cPasswordTextEditingController,
                      data: Icons.lock,
                      isObsecure: true,
                      hintText: "Confirm password",
                      val: (val) {
                        if (val.isEmpty) return 'Empty';
                        if (val != passwordTextEditingController.text)
                          return 'Not Match';
                        return null;
                      }),
                  DefaultButton(
                    text: "Next",
                    press: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpForm(
                                      name: nameTextEditingController.text,
                                      email: emailTextEditingController.text,
                                      phone: mobileTextEditingController.text,
                                      password:
                                          cPasswordTextEditingController.text,
                                      image: _imageFileList,
                                    )));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
