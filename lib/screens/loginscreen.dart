// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, curly_braces_in_flow_control_structures, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/widget/screenhome.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Brand",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " Hub",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 255, 153, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "L O G I N",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 3,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                validator: (Value) {
                  if (Value == null || Value.isEmpty) {
                    return "enter the username";
                  } else
                    return null;
                },
                controller: usernamecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.horizontal()),
                    hintText: "user name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "enter the password";
                  } else
                    return null;
                },
                controller: passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.horizontal()),
                    hintText: "password"),
              ),
            ),
            SizedBox(
              height: 50,
              width: 480,
              child: ElevatedButton(
                onPressed: () {
                  checklogin(context);
                  if(formkey.currentState!.validate()){
                    checklogin(context);
                  }
                  
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 236, 235, 235)),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  checklogin(BuildContext context) async {
    final username = usernamecontroller.text;
    final password = passwordcontroller.text;
    if (username==password &&username.isNotEmpty ) {
      final shareprfs= await SharedPreferences.getInstance();
        shareprfs.setBool(save_keyname,true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreeenHome()));
    } else {
      return;
    }
  }
}
