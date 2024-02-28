import 'package:hive_flutter/hive_flutter.dart';
part 'shoewomen.g.dart';

@HiveType(typeId: 3)
class ShoeWomen {
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String text;
  @HiveField(3)
  final String price;
  ShoeWomen({required this.image, required this.price, required this.text});
}
