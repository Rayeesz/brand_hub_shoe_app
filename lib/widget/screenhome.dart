// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';

import 'package:travel_app/screens/cart.dart';
import 'package:travel_app/screens/mainscreen.dart';
import 'package:travel_app/screens/orders.dart';

import 'package:travel_app/screens/user.dart';


class ScreeenHome extends StatefulWidget {
  const ScreeenHome({super.key});

  @override
  State<ScreeenHome> createState() => _ScreeenHomeState();
}

class _ScreeenHomeState extends State<ScreeenHome> {
  int _currentSelectIndex = 0;
  final _pages = [
  Mainscreen(),
 Orders() ,
 Cart(),
  User(),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentSelectIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 255, 153, 0),
          unselectedItemColor: Colors.black,
          currentIndex: _currentSelectIndex,
          onTap: (newindex) {
            setState(() {
              _currentSelectIndex = newindex;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.border_outer_rounded), label: 'orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_outlined),
                label: 'cart'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'details'),
          ]),
    );
  }
}
