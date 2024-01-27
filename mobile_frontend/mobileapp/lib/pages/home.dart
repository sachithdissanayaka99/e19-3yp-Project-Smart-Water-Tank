import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
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
          IconButton(onPressed:(){

            Navigator.pushNamed(context, '/profile');
          }, icon: Icon(Icons.arrow_drop_down_sharp)
          ,
          color: Colors.black,), ],
        backgroundColor: Colors.white,
        

      ) ,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
//container--------WATER TANK---------------------------------------------1
Container(
  // ignore: prefer_const_constructors
  margin: EdgeInsets.all(8.0), // Set the desired margin value
  child: ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, '/tank');
    },
    // ignore: sort_child_properties_last
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.battery_0_bar_sharp,
        size:screenSize.height*0.1,),
        Text('WATER TANK',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Rubik',
        ),),
      
      ],
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 20, 36)),
      minimumSize: MaterialStateProperty.all<Size>(
        Size(screenSize.width * 0.94, screenSize.height * 0.2),
        
      ),
    ),
    
  ),
   
),
//container--------------------IN_OUT---------------------------------2
Container(
  // ignore: prefer_const_constructors
  margin: EdgeInsets.all(8.0), // Set the desired margin value
  child: ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, '/inout');

    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.input_sharp,
        size:screenSize.height*0.1,),
        Text('INLET-OUTLET',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Rubik',
        ),),
      ],
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 20, 36)),
      minimumSize: MaterialStateProperty.all<Size>(
        Size(screenSize.width * 0.94, screenSize.height * 0.2),
      ),
    ),
  ),
),
//container-----------------------------------------------------3
Container(
  // ignore: prefer_const_constructors
  margin: EdgeInsets.all(8.0), // Set the desired margin value
  child: ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, '/bill');
    },
    // ignore: sort_child_properties_last
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.note_add_rounded,
        size:screenSize.height*0.1,),
        Text('MONTHLY BILL',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Rubik',
        ),),
      
      ],
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 20, 36)),
      minimumSize: MaterialStateProperty.all<Size>(
        Size(screenSize.width * 0.94, screenSize.height * 0.2),
      ),
    ),
  ),
),
//container-----------------------------------------------------4
Container(
  // ignore: prefer_const_constructors
  margin: EdgeInsets.all(8.0), // Set the desired margin value
  child: ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, '/usage');},
    // ignore: sort_child_properties_last
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.bar_chart,
        size:screenSize.height*0.1,),
        Text('WATER USAGE',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Rubik',
        ),),
      
      ],
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 20, 36)),
      minimumSize: MaterialStateProperty.all<Size>(
        Size(screenSize.width * 0.94, screenSize.height * 0.2),
      ),
    ),
  ),
),
        ],
      ),

    );

  }
}