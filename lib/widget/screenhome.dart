// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/screenhome_providerdemo.dart';
// ignore: must_be_immutable
class ScreeenHome extends StatelessWidget {
  ScreeenHome({super.key});
  int _currentSelectIndex = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScreeenHomeprovider>(context);
    return Scaffold(
      body: provider.pages[provider.currentSelectIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 255, 153, 0),
          unselectedItemColor: Colors.black,
          currentIndex: _currentSelectIndex,
          onTap: (newindex) {
            provider.indexvalue(newindex);
            _currentSelectIndex = newindex;
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
