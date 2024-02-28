// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:hive/hive.dart';
  part 'shoemodel.g.dart';


@HiveType(typeId: 2)
class Shoe {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final String price;
  @HiveField(2)
  final String image;
  Shoe({required this.text, required this.price, required this.image});
}

