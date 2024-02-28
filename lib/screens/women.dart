// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';

import 'package:travel_app/function/shoewomen.dart';
import 'package:travel_app/model/shoewomenmodel/shoewomen.dart';


import 'package:travel_app/screens/buynow.dart';
import 'package:travel_app/screens/piechart.dart';

class Women extends StatelessWidget {
  const Women({super.key});

  @override
  Widget build(BuildContext context) {
    getAllWomenshoesDetils();

    List<int> totalwomen=[];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
      body: Column(
        children: [
          Container(
            child: Image.asset("assets/Screenshot 2024-02-01 153340.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Filter",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 110, 133, 237)),
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  "Women's Footwear: 300 products",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: ShoeWomenlist,
              builder: (BuildContext ctx, List<ShoeWomen> shoewomenlist,
                  Widget? child) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 00.0,
                  ),
                  itemCount: shoewomenlist.length,
                  itemBuilder: (context, index) {
                    final shoe = shoewomenlist[index];
                    totalwomen.add(int.parse(shoe.price));
                    double total=totalwomen.reduce((value, element) => value+element).toDouble();
                    Chart.womenvalue=total;
            
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Ref(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Order(
                                    name: shoe.text,
                                    price: shoe.price,
                                    imagepath: shoe.image)));
                          },
                          text: shoe.text,
                          price: shoe.price,
                          image: shoe.image),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Ref extends StatelessWidget {
  final String text;
  final String image;
  final String price;
  final VoidCallback onPressed;

  const Ref({
    Key? key,
    required this.image,
    required this.text,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Card(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(price),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
