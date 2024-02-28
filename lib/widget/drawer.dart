// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/screens/men.dart';


import 'package:travel_app/screens/loginscreen.dart';
import 'package:travel_app/screens/women.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          Container(
            child: Image.asset("assets/croped.jpg"),
          ),
          ListTile(
            title: Text(
              "Men",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Men()));
   
            },
            trailing: Icon(Icons.boy),
          ),
          ListTile(
            title: Text("Women", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Women ()));
            },
            trailing: Icon(Icons.woman),
          ),
          ListTile(
            title:
                const Text('App Info', style: TextStyle(color: Colors.white)),
            onTap: () {},
            trailing: const Icon(
              Icons.info_outline,
            ),
          ),
          Container(
              color: Colors.orange,
              child: ElevatedButton(
                onPressed: () {
                  logout();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Loginscreen()));
                },
                child: Text(
                  "logout",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange)),
              ))
        ],
      ),
    );
  }

  logout() async {
    final shareprfs = await SharedPreferences.getInstance();

    shareprfs.clear();
  }
}
