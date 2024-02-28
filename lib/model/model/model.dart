// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types
import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class CoustmerDetils {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String number;
  @HiveField(3)
  final String address;
  @HiveField(4)
  final String pincode;
  @HiveField(5)
  final  String state;
  @HiveField(6)
  final  String city;
  CoustmerDetils(
      {required this.name,
      required this.number,
      required this.address,
      required this.pincode,
      required this.state,
      required this.city});
}


