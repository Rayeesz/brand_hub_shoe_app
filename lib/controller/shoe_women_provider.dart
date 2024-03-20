import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/function/shoewomen.dart';
import 'package:travel_app/model/shoewomenmodel/shoewomen.dart';

class ShoeWomenprovider extends ChangeNotifier {
  List<ShoeWomen> shoelist = [];
  WomenShoe ws = WomenShoe();
 

  addws(ShoeWomen value) async {
    await ws.addWomenshoe(value);
    getallws();
  }

  getallws() async {
    shoelist = await ws.getAllWomenshoesDetils();
    notifyListeners();
  }

  
}
