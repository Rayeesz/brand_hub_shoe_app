// ignore: camel_case_types
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/view/cart.dart';
import 'package:travel_app/view/mainscreen.dart';
import 'package:travel_app/view/orders.dart';
import 'package:travel_app/view/user.dart';



// ignore: camel_case_types
class ScreeenHomeprovider extends ChangeNotifier {
  int currentSelectIndex = 0;
  final pages = [
  Mainscreen(),
 Orders() ,
 Cart(),
  User(),
   ];
   indexvalue(newinex){
    currentSelectIndex=newinex;
    notifyListeners();
   }
}
