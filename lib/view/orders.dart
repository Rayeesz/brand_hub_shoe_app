// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/model/model/model.dart';
import 'package:travel_app/controller/orders_provider.dart';
import 'package:travel_app/controller/search_provider.dart';
import 'package:travel_app/view/editorders.dart';
import 'package:travel_app/view/viewadress.dart';
import 'package:travel_app/widget/screenhome.dart';


class Orders extends StatelessWidget {
  const Orders({Key? key});

  @override
  Widget build(BuildContext context) {
   Provider.of<OrderProvider>(context,listen: false).gettallorders();
    final searchpro=Provider.of<searchprovider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ScreeenHome()));
        }, icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          "My Orders",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 243, 147, 3),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onChanged: (value) {
                searchpro.search=value;
                searchpro.checkSearch(context);
              },
              decoration: InputDecoration(
                hintText: 'Enter customer name',
                suffixIcon: Icon(Icons.mic),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer2<searchprovider,OrderProvider>(
              builder: (BuildContext ctx ,searchvalue,coustmersearch,child) {
                return 
                SizedBox(child:searchvalue.search.isNotEmpty?coustmersearch.coustmerSearchList.isEmpty? Center(child: Text('No customer available')):customerbuild(coustmersearch.coustmerSearchList)
                :customerbuild(coustmersearch.orderList));
              }
            ),
          ),
        ],
      ),
    );
  }


  Widget customerbuild(List<CoustmerDetils> customerlist) {

    return customerlist.isEmpty?SizedBox(child: Center(child: Text('No data found'),),):
    ListView.separated(
      itemBuilder: (ctx, index) {
        final data = customerlist[index];
        return ListTile(
          onTap: () {
            Navigator.of(ctx).push(MaterialPageRoute(
                builder: (context) => ViewScreen(
                    name:data.name ,
                    phone: data.number,
                    adress: data.address,
                    pincode: data.pincode,
                    state: data.state,
                    city:data.city)));
          },
          title: Text(
            data.name,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(data.number),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                 Provider.of<OrderProvider>(ctx,listen: false).deleteCoustmer(index);
                  
                },
                icon: Icon(Icons.delete),
                style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.red),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(ctx).push(
                    MaterialPageRoute(
                        builder: (context) => Editorders(
                              index: index,
                              name: data.name,
                              number: data.number,
                              adress: data.address,
                              pincode: data.pincode,
                              state: data.state,
                              city: data.state,
                            )),
                  );
                },
                icon: Icon(Icons.edit),
                style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.red),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return Divider(
          thickness: 20,
          color: Colors.orange,
        );
      },
      itemCount: customerlist.length,
    );
  }
}
