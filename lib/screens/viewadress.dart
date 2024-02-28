// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String adress;
  final String pincode;
  final String state;
  final String city;

  const ViewScreen(
      {super.key,
      required this.name,
      required this.phone,
      required this.adress,
      required this.pincode,
      required this.state,
      required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    " NAME        :  $name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "NUMBER    :  $phone",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    " ADDRESS  :  $adress",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "PINCODE   :  $pincode",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "STATE      :   $state",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "CITY        :   $city",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Divider()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
