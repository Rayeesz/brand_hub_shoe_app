// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, sort_child_properties_last, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, constant_identifier_names, camel_case_types, prefer_const_literals_to_create_immutables, unused_element
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/model/shoemen/shoemodel.dart';
import 'package:travel_app/model/shoewomenmodel/shoewomen.dart';
import 'package:travel_app/controller/addprovider.dart';
import 'package:travel_app/controller/shoe_men_provider.dart';
import 'package:travel_app/controller/shoe_women_provider.dart';
import 'package:travel_app/widget/screenhome.dart';

class Addshoes extends StatelessWidget {
  Addshoes({Key? key});

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
      body: Consumer<addProvider>(builder: (context, addscreenprovider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 150,
              backgroundImage: addscreenprovider.selectedImage != null
                  ? FileImage(addscreenprovider.selectedImage!)
                  : AssetImage("assets/OIP (3).jpg") as ImageProvider,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: DropdownButton<database>(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  value: addscreenprovider.selectedatabase,
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
                    addscreenprovider.selectedDb(value);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.orange,
              child: ElevatedButton(
                onPressed: () {
                  addscreenprovider.pickImageFromGallery();
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
              controller: addscreenprovider.namecontroller,
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
              controller: addscreenprovider.pricecontoller,
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
                  addbutton(context);
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
        );
      }),
    );
  }

  void addbutton(BuildContext context) async {
    final addButtonProvider = Provider.of<addProvider>(context, listen: false);
    if (addButtonProvider.selectedatabase == database.MenDB) {
      final _name = addButtonProvider.namecontroller.text;
      final _price = addButtonProvider.pricecontoller.text;
      if (_name.isEmpty || _price.isEmpty) {
        return;
      }
      final shoe =
          Shoe(text: _name, price: _price, image:addButtonProvider.selectedImage!.path);
      Provider.of<shoeMenprovider>(context, listen: false).addMs(shoe);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Addshoes()));
    } else if (addButtonProvider.selectedatabase == database.WomenDb) {
      final name = addButtonProvider.namecontroller.text;
      final price = addButtonProvider.pricecontoller.text;
      if (name.isEmpty || price.isEmpty) {
        return;
      }
      final _womendata =
          ShoeWomen(image:addButtonProvider.selectedImage!.path, price: price, text: name);

      Provider.of<ShoeWomenprovider>(context, listen: false).addws(_womendata);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Addshoes()));
    }
  }
}
