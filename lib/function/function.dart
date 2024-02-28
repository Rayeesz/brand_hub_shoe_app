import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/model/model/model.dart';

ValueNotifier<List<CoustmerDetils>> coustmerlistnotifier = ValueNotifier([]);

addcoustmerDetils(CoustmerDetils value) async {
  final coustmerdb = await Hive.openBox<CoustmerDetils>("coustmer db");
  coustmerdb.add(value);
  coustmerlistnotifier.value.add(value);
  coustmerlistnotifier.notifyListeners();
}

getAllCoustmer() async {
  final coustmerdb = await Hive.openBox<CoustmerDetils>("coustmer db");

  coustmerlistnotifier.value.clear();
  coustmerlistnotifier.value.addAll(coustmerdb.values);
  coustmerlistnotifier.notifyListeners();
}

Future<void> deleteCoustmer(int index) async {
  final coustmerdb = await Hive.openBox<CoustmerDetils>("coustmer db");
  await coustmerdb.deleteAt(index);
  getAllCoustmer();
}

editCoustmer(CoustmerDetils value, int index) async {
  final coustmerdb = await Hive.openBox<CoustmerDetils>("coustmer db");
  coustmerlistnotifier.value.clear();
  coustmerdb.putAt(index, value);
  coustmerlistnotifier.notifyListeners();
  getAllCoustmer();
}
