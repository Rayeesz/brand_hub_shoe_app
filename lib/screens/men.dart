// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_app/function/shoefunction.dart';
import 'package:travel_app/model/shoemen/shoemodel.dart';



import 'package:travel_app/screens/buynow.dart';
import 'package:travel_app/screens/piechart.dart';
import 'package:travel_app/widget/screenhome.dart';

class Men extends StatefulWidget {
  const Men({Key? key});

  @override
  State<Men> createState() => _MenState();
}

class _MenState extends State<Men> {
  List<int> mentotal = [];

  @override
  Widget build(BuildContext context) {
    getAllshoeDetils();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ScreeenHome()));
            },
            icon: Icon(Icons.arrow_back)),
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
            child: Image.asset("assets/men.png"),
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
                    color: Color.fromARGB(255, 110, 133, 237),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  "Men's Footwear: 210 products",
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: shoedetilsnoti,
              builder: (BuildContext ctx, List<Shoe> shoelist, Widget? child) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 00.0,
                  ),
                  itemBuilder: (context, index) {
                    final shoe = shoelist[index];
                    mentotal.add(int.parse(shoe.price));
                    double total = mentotal
                        .reduce((value, element) => value + element)
                        .toDouble();
                    Chart.menvalue = total;

                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Ref(
                          onpressed: () {
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
                  itemCount: shoelist.length,
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
  final VoidCallback onpressed;

  const Ref({
    Key? key,
    required this.image,
    required this.text,
    required this.price,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Card(
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
            ),
          ],
        ),
      ),
    );
  }
}
