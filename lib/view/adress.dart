// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, camel_case_types, dead_code, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:travel_app/model/model/model.dart';
import 'package:travel_app/controller/booking_provider.dart';
import 'package:travel_app/controller/orders_provider.dart';
import 'package:travel_app/view/men.dart';


import 'package:travel_app/widget/screenhome.dart';

class Address extends StatelessWidget {
  Address({super.key});

  @override
  Widget build(BuildContext context) {
  
    final addProvider = Provider.of<BookingProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add delivey adress"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (context) => Men()));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Color.fromARGB(255, 243, 147, 3),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: addProvider.formkey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                controller: addProvider.namecontroller,
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
                controller: addProvider.phonecontroller,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                controller: addProvider.addresscontroller,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                controller: addProvider.pincodecontroller,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                controller: addProvider.statecontroller,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                controller: addProvider.citycontroller,
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
                    if (addProvider.formkey.currentState!.validate()) {
                      saveaddress(context);
                      dilogbox(context);
                    }
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

  saveaddress(BuildContext context) async {
    final addProvider = Provider.of<BookingProvider>(context, listen: false);
    final name = addProvider.namecontroller.text;
    final number = addProvider.phonecontroller.text;
    final address = addProvider.addresscontroller.text;
    final pincode = addProvider.pincodecontroller.text;
    final state = addProvider.statecontroller.text;
    final city = addProvider.citycontroller.text;
    if (name.isEmpty ||
        number.isEmpty ||
        address.isEmpty ||
        pincode.isEmpty ||
        state.isEmpty ||
        state.isEmpty ||
        city.isEmpty) {
      return;
    }

    final list = CoustmerDetils(
        name: name,
        number: number,
        address: address,
        pincode: pincode,
        state: state,
        city: city);
  
     
       Provider.of<OrderProvider>(context,listen: false).addcoustmer(list);


    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ScreeenHome()));
  }

  void dilogbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("your order placed"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("ok"))
              ],
            ));
  }
}
