import 'package:flutter/material.dart';
import 'package:travel_app/function/function.dart';

import 'package:travel_app/model/model/model.dart';

class OrderProvider extends ChangeNotifier {
  List<CoustmerDetils> orderList = [];
  List<CoustmerDetils> coustmerSearchList=[];
  Orderservice orderservice = Orderservice();
  addcoustmer(CoustmerDetils value) async {
    await orderservice.addcoustmerDetils(value);
    gettallorders();
  }

  gettallorders() async {
    orderList = await orderservice.getAllCoustmer();
    notifyListeners();
  }

  deleteCoustmer(int index) async {
    await orderservice.deleteCoustmer(index);
    await gettallorders();
  }

  editCoustmer(value, index) async {
    await orderservice.editCoustmer(value, index);
    await gettallorders();
  }

 orderSearchList(List<CoustmerDetils>valuee){
  
 coustmerSearchList=valuee;
 notifyListeners();
 }

}
