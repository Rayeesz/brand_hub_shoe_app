import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:travel_app/function/function.dart';
import 'package:travel_app/model/cartmodel/cartmodel.dart';

ValueNotifier<List<CartModel>> cartListnoti = ValueNotifier([]);

addcart(CartModel value) async {
  final cartDb = await Hive.openBox<CartModel>("cart db");
  cartDb.add(value);
  cartListnoti.value.add(value);
  coustmerlistnotifier.notifyListeners();
}

getAllCart() async {
  final cartDb = await Hive.openBox<CartModel>("cart db");
  cartListnoti.value.clear();
  cartListnoti.value.addAll(cartDb.values);
  cartListnoti.notifyListeners();
}
