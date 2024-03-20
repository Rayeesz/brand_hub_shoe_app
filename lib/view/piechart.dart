// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/function/shoefunction.dart';
import 'package:travel_app/function/shoewomen.dart';
import 'package:travel_app/controller/shoe_men_provider.dart';
import 'package:travel_app/controller/shoe_women_provider.dart';

import 'package:travel_app/widget/screenhome.dart';


class PieChartPage extends StatelessWidget {
   PieChartPage({super.key});
  List<Color> listColors = [Colors.pink, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    shoeMen shoemen=shoeMen();
    WomenShoe womenShoe=WomenShoe();
   
   shoemen.getAllshoeDetils();
   womenShoe.getAllWomenshoesDetils();

   final menPro=Provider.of<shoeMenprovider>(context);
   final womenPro=Provider.of<ShoeWomenprovider>(context);
   final dbmen= menPro.shoeMenlist;
   final Womendb=womenPro.shoelist;
   double totalA=0;
   double totalB=0;
   for(var element in dbmen){
    totalA += int.parse(element.price);

   }
   for(var element in Womendb){
    totalB += int.parse(element.price);

   }
   late Map<String,double>datas={
      'men': totalA,
     'Women': totalB,
   };




    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ScreeenHome()));
      }, icon: Icon(Icons.arrow_back)),),
      body: Consumer2<shoeMenprovider,shoeMenprovider>(
        builder: (context,menpro,womenpro,_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PieChart(
                animationDuration: const Duration(seconds: 2),
                dataMap: datas,
                colorList: listColors,
                chartType: ChartType.disc,
                ringStrokeWidth: 30,
                centerText: 'Chart',
                chartLegendSpacing: 50,
                chartRadius: MediaQuery.of(context).size.width / 2,
                chartValuesOptions: const ChartValuesOptions(
                    showChartValues: true,
                    showChartValueBackground: false,
                    showChartValuesOutside: true),
                legendOptions: const LegendOptions(
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.bottom,
                    legendShape: BoxShape.rectangle),
              ),
            ],
          );
        }
      ),
    );
  }
}
class Chart {
  static double menvalue = 0;
  static double womenvalue=0;
}
  