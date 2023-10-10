import "dart:async";
import "dart:html";
import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:farm_swap_karl/routes/routes.dart";
import "package:file_picker/file_picker.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/material.dart";

import "../data/sign_up_idretreival.dart";

class AdminSignup3 extends StatefulWidget {
  const AdminSignup3({super.key});

  @override
  State<AdminSignup3> createState() => _AdminSignup3State();
}

class _AdminSignup3State extends State<AdminSignup3> {
  //Variables to be assigned for each pictures picked
  String idUrl = "";
  String profileUrl = "";
  Uint8List? downloadUrl;

  GetDocumentId test = GetDocumentId();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register 2"),
      ),
      body: Center(
          child: SizedBox(
        height: 500,
        width: 500,
        child: Column(children: [
/*Column for Profile Picture */
          Column(
            children: [
              const Text("Select Profile Picture"),
              const SizedBox(
                height: 5,
              ),
              IconButton(
                onPressed: () {
                  //uploadImage();
                  pickImage1();
                },
                icon: const Icon(Icons.add_a_photo),
              ),
            ],
          ),
/*Column for ID Picture */
          Column(
            children: [
              const Text("Select Profile Picture"),
              const SizedBox(
                height: 5,
              ),
              IconButton(
                onPressed: () {
                  //uploadImage2();
                  pickImage2();
                },
                icon: const Icon(Icons.add_a_photo),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              uploadImage1(selectedImageInBytes!);
              uploadImage2(selectedImageInBytes2!);
              updateField();
            },
            child: const Text("Finish"),
          ),
          ElevatedButton(
            onPressed: () {
              updateField();
              Navigator.of(context).pushNamed(RoutesManager.signInPage);
            },
            child: const Text("Finish 2"),
          ),
        ]),
      )),
    );
  }

  //Upload Image variables
  String _imageFiles = "";
  String imageFiles2 = "";
  Uint8List? selectedImageInBytes;
  Uint8List? selectedImageInBytes2;
  String idurl = "";
  String profileurl = "";

  Future<void> pickImage1() async {
    try {
      FilePickerResult? fileresult = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (fileresult != null) {
        setState(() {
          _imageFiles = fileresult.files.first.name;
          selectedImageInBytes = fileresult.files.first.bytes;
        });
      }
    } catch (e) {
      print("Pick image error");
    }
  }

  Future<void> uploadImage1(Uint8List newimage) async {
    try {
      Reference reference = FirebaseStorage.instance
          .ref("gs://farmswapsample.appspot.com/Images")
          .child('/$_imageFiles');

      var metadata = SettableMetadata();

      if (metadata.contentType == 'image/jpg') {
        metadata = SettableMetadata(contentType: 'image/jpg');
      } else if (metadata.contentType == 'image/png') {
        metadata = SettableMetadata(contentType: 'image/png');
      } else {
        metadata = SettableMetadata(contentType: 'image/jpeg');
      }

      // UploadTask to finally upload image
      UploadTask uploadTask = reference.putData(newimage, metadata);

      // After successfully upload show SnackBar
      await uploadTask.whenComplete(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Image Uploaded"))));
      String url = await reference.getDownloadURL();
      print("First download Url " + url);
      setState(() {
        idurl = url;
      });
    } catch (e) {}
  }

  Future<void> pickImage2() async {
    try {
      FilePickerResult? fileresult = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );
      if (fileresult != null) {
        setState(() {
          imageFiles2 = fileresult.files.first.name;
          selectedImageInBytes2 = fileresult.files.first.bytes;
        });
      }
    } catch (e) {
      print("Pick image error");
    }
  }

  Future<void> uploadImage2(Uint8List newimage) async {
    try {
      Reference reference = FirebaseStorage.instance
          .ref("gs://farmswapsample.appspot.com/Images")
          .child('/$imageFiles2');

      var metadata = SettableMetadata();

      if (metadata.contentType == 'image/jpg') {
        metadata = SettableMetadata(contentType: 'image/jpg');
      } else if (metadata.contentType == 'image/png') {
        metadata = SettableMetadata(contentType: 'image/png');
      } else if (metadata.contentType == "image/jpeg") {
        metadata = SettableMetadata(contentType: 'image/jpeg');
      }

      print("meta data" + metadata.contentType.toString());

      // UploadTask to finally upload image
      UploadTask uploadTask = reference.putData(newimage, metadata);

      // After successfully upload show SnackBar
      await uploadTask.whenComplete(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Image Uploaded"))));
      String url = await reference.getDownloadURL();
      print("First download Url " + url);
      setState(() {
        profileurl = url;
      });
    } catch (e) {}
  }

  //Function to upate a field
  Future<void> updateField() async {
    print("This is idurl" + idurl);
    print("This is profile" + profileurl);
    await test.getUserID();
    final docRef =
        FirebaseFirestore.instance.collection("Users").doc(test.docID);
    final updateFields = {
      "ID Url": idurl,
      "Profile Url": profileurl,
    };

    await docRef.update(updateFields);
  }
/*
//Method for selecting an ID picuture
  Future<void> uploadImage() async {
    final FileUploadInputElement input = FileUploadInputElement();
    input.accept = "image/*";
    input.click();

    final completer = Completer<String>();

    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();

      reader.onLoadEnd.listen((event) {
        completer.complete(reader.result as String);
      });
      reader.readAsDataUrl(file);
    });

    final downloadUrl = await completer.future;
    //update.idUrl = downloadUrl;
    setState(() {
      idUrl = downloadUrl;
    });
  }

/*Function for uploading the profile picutre */
  Future<void> uploadImage2() async {
    final FileUploadInputElement input = FileUploadInputElement();
    input.accept = "image/*";
    input.click();

    final completer = Completer<String>();

    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();

      reader.onLoadEnd.listen((event) {
        completer.complete(reader.result as String);
      });
      reader.readAsDataUrl(file);
    });

    final downloadUrl = await completer.future;
    //update.profileUrl = downloadUrl;
    setState(() {
      profileUrl = downloadUrl;
    });
  }

  //Function to upate a field
  Future<void> updateField() async {
    await test.getUserID();
    final docRef =
        FirebaseFirestore.instance.collection("Users").doc(test.docID);
    final updateFields = {
      "ID Url": idUrl,
      "Profile Url": profileUrl,
    };

    await docRef.update(updateFields);
  }*/*/*/
}
