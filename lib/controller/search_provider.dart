// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/orders_provider.dart';

class searchprovider extends ChangeNotifier {

  String search = '';
  void checkSearch(BuildContext context) {
    final coustmerprovider = Provider.of<OrderProvider>(context,listen: false);

   final  searchedList = coustmerprovider.orderList
        .where((Shoe) => Shoe.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
      coustmerprovider.orderSearchList(searchedList);
    
  }
}
