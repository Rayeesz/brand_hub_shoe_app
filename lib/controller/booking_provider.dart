import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier{
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
 

}