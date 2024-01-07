import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Usage extends StatefulWidget{
  @override
  _usage createState() => _usage();
}

class _usage extends State<Usage>{

  List<waterData> data = [
    waterData('Sunday', 200),
    waterData('monday', 150),
    waterData('tuesday', 80),
    waterData('wendesday', 50),
    waterData('thursday', 190),
    waterData('friday', 110),
    waterData('saturday', 100),
  ];

  @override
  Widget build(BuildContext context){
    final screenSize = MediaQuery.of(context).size; // Define screenSize variable
    return Scaffold(
      appBar:AppBar(
        title: SizedBox(
          height: screenSize.height * 0.08, // Set maximum height for the image
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        //centerTitle: true,
        actions:[ 
          // ignore: prefer_const_constructors
          IconButton(
            onPressed:(){Navigator.pushNamed(context, '/home');}, 
            icon: Icon(Icons.arrow_drop_down_sharp),
            color: Colors.black,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Water Usage'),
              legend: Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<dynamic, dynamic>>[
                LineSeries<waterData, String>(
                  dataSource: data, 
                  xValueMapper: (waterData water,_)=> water.day, 
                  yValueMapper: (waterData water,_)=>water.water,
                  name:'Water Usage',
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class waterData {
  final String day;
  final double water;

  waterData(this.day, this.water);
}
 