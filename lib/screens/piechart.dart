// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:travel_app/widget/screenhome.dart';


class PieChartPage extends StatefulWidget {
  const PieChartPage({super.key});

  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  late double totalmenvalue;
  late double totalwomenvalue;

  late Map<String, double> datas;

  @override
  void initState() {
    super.initState();
    addchartvalues();
  }

  void addchartvalues() {
      setState(() {
        totalmenvalue = Chart.menvalue;
        totalwomenvalue = Chart.womenvalue;
        datas = {
          'men': totalmenvalue,
          'Women': totalwomenvalue,
        };
      });
  }

  List<Color> listColors = [Colors.pink, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){
        Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ScreeenHome()));
      }, icon: Icon(Icons.arrow_back)),),
      body: Column(
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
      ),
    );
  }
}

class Chart {
  static double menvalue = 0;
  static double womenvalue=0;
}