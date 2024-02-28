// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_app/function/function.dart';
import 'package:travel_app/model/model/model.dart';

import 'package:travel_app/screens/men.dart';

class Editorders extends StatefulWidget {
  final String name;
  var number;
  var adress;
  var pincode;
  var state;
  var city;
  int index;
  Editorders({super.key, 
    required this.index,
    required this.name,
    required this.number,
    required this.adress,
    required this.pincode,
    required this.state,
    required this.city,
  });

  @override
  State<Editorders> createState() => _EditordersState();
}

class _EditordersState extends State<Editorders> {
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var pincodecontroller = TextEditingController();
  var statecontroller = TextEditingController();
  var citycontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    namecontroller = TextEditingController(text: widget.name);
    phonecontroller= TextEditingController(text:widget.number);
    addresscontroller= TextEditingController(text: widget.adress);
    pincodecontroller=TextEditingController(text: widget.pincode);
    statecontroller=  TextEditingController(text: widget.state);
    citycontroller=  TextEditingController(text: widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add delivey adress"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (context) =>  Men()));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Color.fromARGB(255, 243, 147, 3),
      ),
      body: SingleChildScrollView(
          child: Form(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: namecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Full name(required)",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: phonecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Phone number(required)",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: addresscontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Address(required)",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: pincodecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "PINCODE(required)",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: statecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "State(required)",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: citycontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "city(required)",
                ),
              ),
            ),
            Container(
                width: 450,
                height: 50,
                color: Colors.orange,
                child: ElevatedButton(
                  onPressed: () {
                    updateall();
                  },
                  child: Text(
                    "Save Address",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                ))
          ],
        ),
      )),
    );
  }

  updateall() async {
    final name0 = namecontroller.text;
    final number0 = phonecontroller.text;
    final address0 = addresscontroller.text;
    final pincode0 = pincodecontroller.text;
    final state0 = statecontroller.text;
    final city0 = citycontroller.text;
    if (name0.isEmpty ||
        number0.isEmpty ||
        address0.isEmpty ||
        pincode0.isEmpty ||
        state0.isEmpty ||
        city0.isEmpty) {
      return;
    } else {
      final update = CoustmerDetils(
          name: name0,
          number: number0,
          address: address0,
          pincode: pincode0,
          state: state0,
          city: city0);
      editCoustmer(update, widget.index);
      Navigator.pop(context);
      
    }
  }
}
