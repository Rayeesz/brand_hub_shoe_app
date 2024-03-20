// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, camel_case_types, unnecessary_string_interpolations


import 'package:flutter/material.dart';
import 'package:travel_app/function/cartfunction.dart';
import 'package:travel_app/model/cartmodel/cartmodel.dart';
import 'package:travel_app/view/adress.dart';
import 'package:travel_app/view/cart.dart';


class Order extends StatelessWidget {
  final String name;
  final String price;
  final String imagepath;
  const Order({
    super.key,
    required this.name,
    required this.price,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                  "assets/adidas-samba-og-herren-sneaker-weiss-b75806_4.webp"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "adidas Men shoe",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 350),
                  Text(
                    "₹$price",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 235, 143, 5),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text("hurry only a few left!",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 231, 7, 7),
                        fontWeight: FontWeight.bold))),
            SizedBox(
              height: 5,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Free delivery",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300))),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text("sizes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600))),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  size(text: "US7", onPressed: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  size(text: "US7.5", onPressed: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  size(text: "US8", onPressed: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  size(text: "US8.5", onPressed: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  size(text: "US9", onPressed: () {}),
                  SizedBox(
                    width: 5,
                  ),
                  size(
                    text: "US9.5",
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  size(text: "US10", onPressed: () {}),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Description",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Originally made for the football field but soon evolving into a symbol of street style, Samba shoes radiate retro funk. These stunning sneakers are now comfier than ever thanks to full grain leather uppers and suede details. With a diverse range that includes classic trainers as well as styles specialised for skateboarding and winter sports, adidas Samba shoes simply can’t be beaten.",
                style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Address()));
                  },
                  child: Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                ),
              ),
            ),SizedBox(height: 20,)
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.lightGreenAccent,
        backgroundColor: const Color.fromARGB(255, 253, 246, 246),
        onPressed: () {
          
          addcart(CartModel(image: imagepath, price: price, text: name));
          
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  Cart()));
                 
        },
        child: Icon(
          Icons.shopping_cart,
        ),
      ),
    );
  }
}

//shoe size
class size extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const size({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 30,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), border: Border.all()),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
