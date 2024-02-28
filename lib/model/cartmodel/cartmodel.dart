// ignore_for_file: non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
  part 'cartmodel.g.dart';


@HiveType(typeId: 4)
class CartModel {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String image;
  
  int Quantity;

  CartModel({required this.image, required this.price, required this.text, this.Quantity=1}
  );
}
