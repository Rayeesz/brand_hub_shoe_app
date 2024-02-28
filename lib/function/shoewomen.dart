// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:travel_app/model/shoewomenmodel/shoewomen.dart';

ValueNotifier<List<ShoeWomen>> ShoeWomenlist = ValueNotifier([]);
Future<void> addWomenshoe(ShoeWomen value) async {
  final shoeWomenDb = await Hive.openBox<ShoeWomen>("shoe Women db");
  shoeWomenDb.add(value);
  ShoeWomenlist.value.add(value);
  ShoeWomenlist.notifyListeners();
}

getAllWomenshoesDetils() async {
  final shoeWomenDb = await Hive.openBox<ShoeWomen>("shoe Women db");
  ShoeWomenlist.value.clear();
  ShoeWomenlist.value.addAll(shoeWomenDb.values);
  
  ShoeWomenlist.notifyListeners();
}
