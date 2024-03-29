// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last, must_be_immutable, unnecessary_string_interpolations, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/function/cartfunction.dart';

import 'package:travel_app/model/cartmodel/cartmodel.dart';

import 'package:travel_app/view/adress.dart';
import 'package:travel_app/widget/screenhome.dart';

class Cart extends StatefulWidget {
  Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int totalprice = 0;
  

  @override
  void initState() {
    getAllCart();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ScreeenHome()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 233, 124, 15),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: cartListnoti,
              builder:
                  (BuildContext ctx, List<CartModel> cartlist, Widget? child) {
                return cartlist.isEmpty
                    ? Center(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Lottie.asset(
                              'assets/Animation - 1709196906492.json'),
                        ),
                      )
                    : Stack(children: [
                        ListView.builder(
                          itemCount: cartlist.length,
                          itemBuilder: (ctx, index) {
                            final cart = cartlist[index];
                            // getAllshoeDetils();

                            List<int?> price = [];
                            for (var element in cartlist) {
                              price.add(int.tryParse(element.price)!.toInt());
                            }

                            totalprice = price
                                .reduce((value, element) => value! + element!)!;

                            return Padding(
                              padding: EdgeInsets.all(30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(cart.image),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 50),
                                          Text(
                                            cart.text,
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Quantity:',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w200,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              DropdownButton(
                                                value: cart.Quantity,
                                                items: List.generate(
                                                  10,
                                                  (index) =>
                                                      DropdownMenuItem<int>(
                                                    child: Text("${index + 1}"),
                                                    value: index + 1,
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    if (value != null) {
                                                      cart.Quantity = value;
                                                      totalprice =
                                                          calculateTotalPrice(
                                                              cartListnoti
                                                                  .value);
                                                    }
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "price : ${int.tryParse(cart.price)! * cart.Quantity}",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 50,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    color: Colors.transparent,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 247, 152, 9),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Totalprice:$totalprice',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Address()),
                                              );
                                            },
                                            child: Text(
                                              "place order",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: const Color.fromARGB(
                                                    255, 13, 0, 0),
                                              ),
                                            ),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Colors.yellow,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]);
              },
            ),
          ),
        ],
      ),
    );
  }
  int calculateTotalPrice(List<CartModel> cartList) {
    int total = 0;
    for (var cart in cartList) {
      int? price = int.tryParse(cart.price);
      if (price != null) {
        total += price * cart.Quantity;
      }
    }
    return total;
  }
}
