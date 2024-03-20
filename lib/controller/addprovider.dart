// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum database { MenDB, WomenDb }

class addProvider extends ChangeNotifier {
  database selectedatabase = database.MenDB;
  final namecontroller = TextEditingController();
  final pricecontoller = TextEditingController();
  File? selectedImage;
  void selectedDb(value) {
    selectedatabase = value!;
    notifyListeners();
  }

  Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage == null) {
      return;
    }

    selectedImage = File(returnImage.path);
    notifyListeners();
  }
}
