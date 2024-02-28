// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:travel_app/model/cartmodel/cartmodel.dart';

import 'package:travel_app/model/model/model.dart';
import 'package:travel_app/model/shoemen/shoemodel.dart';



import 'package:travel_app/model/shoewomenmodel/shoewomen.dart';
import 'package:travel_app/widget/splash.dart';

const save_keyname = "save logged in";
void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CoustmerDetilsAdapter().typeId)) {
    Hive.registerAdapter(CoustmerDetilsAdapter());
  }

  if (!Hive.isAdapterRegistered(ShoeAdapter().typeId)) {
    Hive.registerAdapter(ShoeAdapter());
  }
 if (!Hive.isAdapterRegistered(ShoeWomenAdapter().typeId)) {
    Hive.registerAdapter(ShoeWomenAdapter());
  }
  if (!Hive.isAdapterRegistered(CartModelAdapter().typeId)) {
    Hive.registerAdapter(CartModelAdapter());
  }
  
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "travel app",
      debugShowCheckedModeBanner: false,
      home: spalash(),
    );
  }
}
