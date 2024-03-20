

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:travel_app/function/shoefunction.dart';

import '../model/shoemen/shoemodel.dart';

class shoeMenprovider extends ChangeNotifier{
 List<Shoe> shoeMenlist = [];
 shoeMen sm=shoeMen();

 addMs(Shoe value)async{
  await sm.addShoe(value);
  getAllMs();
 }

 getAllMs()async{
   shoeMenlist = await sm.getAllshoeDetils();
    notifyListeners();
 }
}