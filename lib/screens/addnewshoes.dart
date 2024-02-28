// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, sort_child_properties_last, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, constant_identifier_names, camel_case_types, prefer_const_literals_to_create_immutables, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:travel_app/function/shoefunction.dart';
import 'package:travel_app/function/shoewomen.dart';
import 'package:travel_app/model/shoemen/shoemodel.dart';




import 'package:travel_app/model/shoewomenmodel/shoewomen.dart';

import 'package:travel_app/widget/screenhome.dart';

class Addshoes extends StatefulWidget {
  Addshoes({Key? key});

  @override
  State<Addshoes> createState() => _AddshoesState();
}

enum database { MenDB, WomenDb }

class _AddshoesState extends State<Addshoes> {
  final namecontroller = TextEditingController();
  final pricecontoller = TextEditingController();
  database selectedatabase = database.MenDB;
  File? _selectedimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ScreeenHome()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 150,
            backgroundImage: _selectedimage != null
                ? FileImage(_selectedimage!)
                : AssetImage("assets/OIP (3).jpg") as ImageProvider,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DropdownButton<database>(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                value: selectedatabase,
                items: [
                  DropdownMenuItem(
                    child: Text("Men"),
                    value: database.MenDB,
                  ),
                  DropdownMenuItem(
                    child: Text("Women"),
                    value: database.WomenDb,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    selectedatabase = value!;
                  });
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.orange,
            child: ElevatedButton(
              onPressed: () {
                _pickImageFromGallery();
              },
              child: Text(
                "Gallery",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: namecontroller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 246, 242, 242),
              hintText: "name",
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 129, 126, 125),
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: pricecontoller,
            maxLength: 5,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 246, 242, 242),
              hintText: "price",
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 129, 126, 125),
                  width: 2,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.orange,
            child: ElevatedButton(
              onPressed: () {
                addbutton();
              },
              child: Text(
                "submit",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addbutton() async {
    if (selectedatabase == database.MenDB) {
      final _name = namecontroller.text;
      final _price = pricecontoller.text;
      if (_name.isEmpty || _price.isEmpty) {
        return;
      }

      final _shoe =
          Shoe(text: _name, price: _price, image: _selectedimage!.path);
      addShoe(_shoe);
      Navigator.push(context,MaterialPageRoute(builder: (context) => Addshoes()));
    } else if (selectedatabase == database.WomenDb) {
      final name = namecontroller.text;
      final price = pricecontoller.text;
      if (name.isEmpty || price.isEmpty) {
        return;
      }
      final _womendata =
          ShoeWomen(image: _selectedimage!.path, price: price, text: name);

      addWomenshoe(_womendata);
      Navigator.push(context,MaterialPageRoute(builder: (context) => Addshoes()));
    }
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage == null) {
      return;
    }

    setState(() {
      _selectedimage = File(returnImage.path);
    });
  }
}
