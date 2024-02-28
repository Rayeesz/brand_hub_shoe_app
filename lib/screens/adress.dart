// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, camel_case_types, dead_code, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:travel_app/function/function.dart';
import 'package:travel_app/model/model/model.dart';

import 'package:travel_app/screens/men.dart';
import 'package:travel_app/widget/screenhome.dart';
class Address extends StatefulWidget {
  Address({super.key});

  @override
  State<Address> createState() => _AddressState();

  
}

class _AddressState extends State<Address> {
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final pincodecontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
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
        key: formkey,
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
                controller: namecontroller,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  } else {
                    return null;
                  }
                },
                controller: addresscontroller,
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
                controller: pincodecontroller,
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
                controller: statecontroller,
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
                controller: citycontroller,
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
                   
                  
                   if (
                    formkey.currentState!.validate()
                   ) {
                      saveaddress();
                      dilogbox();
                      
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

  saveaddress() async {
    final name =namecontroller.text;
    final number=phonecontroller.text;
    final address=addresscontroller.text;
    final pincode=pincodecontroller.text;
    final state= statecontroller.text;
    final city=citycontroller.text;
    if (name.isEmpty||number.isEmpty||address.isEmpty||pincode.isEmpty||state.isEmpty||state.isEmpty||city.isEmpty) {
      return ;
    } 
      
   
 
    final list=CoustmerDetils(name: name, number: number, address: address, pincode: pincode, state: state, city: city);
      
    addcoustmerDetils(list);
     Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => ScreeenHome()));



 
  }
  void dilogbox(){
  showDialog(context: 
  context, builder: (context)=>AlertDialog(
    content: const Text("your order placed"),
    actions: [TextButton(onPressed: (){
      Navigator.pop(context);
    }, child:Text("ok"))],

  ));


}

}
