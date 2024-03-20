// ignore_for_file: non_constant_identifier_names, avoid_print, camel_case_types


import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/model/shoemen/shoemodel.dart';



class shoeMen{
  addShoe(Shoe value) async {
  final shoeDb = await Hive.openBox<Shoe>("shoedb");
   return shoeDb.add(value);
}
getAllshoeDetils() async {
  final shoeDb = await Hive.openBox<Shoe>("shoedb");
   return shoeDb.values.toList();
}

}

