// ignore_for_file: prefer_const_constructors, camel_case_types, use_build_context_synchronously, sort_child_properties_last, annotate_overrides, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/screens/loginscreen.dart';
import 'package:travel_app/widget/screenhome.dart';

class spalash extends StatefulWidget {
  const spalash({super.key});

  @override
  State<spalash> createState() => _spalashState();
}

class _spalashState extends State<spalash> {
  @override
  void initState() {
    super.initState();
    gotologin();
    checkLogin();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            "assets/Untitled Project (4).jpg",
          ),
          width: 400,
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  gotologin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Loginscreen()));
  }

  checkLogin() async {
    final shareprfs = await SharedPreferences.getInstance();
    final loggin = shareprfs.getBool(save_keyname);
    if (loggin == null || loggin == false) {
      gotologin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreeenHome()));
    }
  }
  
}
