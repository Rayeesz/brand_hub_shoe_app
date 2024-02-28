// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/model/shoemen/shoemodel.dart';


ValueNotifier<List<Shoe>> shoedetilsnoti = ValueNotifier([]);
Future<void> addShoe(Shoe value) async {
  final shoeDb = await Hive.openBox<Shoe>("shoedb");
  shoeDb.add(value);
  shoedetilsnoti.value.add(value);
  shoedetilsnoti.notifyListeners();
  print("Added Shoe: $value");
}
getAllshoeDetils() async {
  final shoeDb = await Hive.openBox<Shoe>("shoedb");
  shoedetilsnoti.value.clear();
  shoedetilsnoti.value.addAll(shoeDb.values);
}

