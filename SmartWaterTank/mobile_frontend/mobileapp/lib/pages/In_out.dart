import 'package:flutter/material.dart';
import 'dart:async';

class In_out extends StatefulWidget{
  @override
  _in_out createState() => _in_out();
}

class _in_out extends State<In_out>{

  int inlet_on=0;
  int outlet_on=0;
  int pump=0;
  String vl_state = 'ON';
  int check=0;
  String checking='start check';
  bool isButtonDisabled = false;

  void startTimer() {
    setState(() {
      isButtonDisabled = true;
      
    });

    Timer(Duration(minutes: 1), () {
      setState(() {
        isButtonDisabled = false;
        
      });
    });
  }

 

  @override
  Widget build(BuildContext context){
    final screenSize = MediaQuery.of(context).size; // Define screenSize variable
    return Scaffold(
      //backgroundColor: Colors.blue[100],
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
          IconButton(onPressed:(){Navigator.pushNamed(context, '/home');}, icon: Icon(Icons.arrow_drop_down_sharp)
          ,
          color: Colors.black,), ],
        backgroundColor: Colors.white,
        

      ) ,
         body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
               child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Inlet Value',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Rubik',
        ),),
        ElevatedButton(onPressed:(){
          setState(() {
            if (pump==0 && check == 0){
               inlet_on ^= 1;
            }
           
          });
        }, child:Text('$inlet_on'),style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 20, 36)),))],
    ),),
            Container(
              padding: EdgeInsets.all(20),
               child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Outlet Value',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Rubik',
        ),),
        ElevatedButton(onPressed:(){
          setState(() {
           if (check == 0){
               outlet_on ^= 1;
            }
          });
        }, child:Text('$outlet_on'),style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 20, 36)),))],
    ),
            ),
            Container(
              padding: EdgeInsets.all(20),
               child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Water Pump',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Rubik',
        ),),
        ElevatedButton(onPressed:(){
          setState(() {
            if (inlet_on==1 && check == 0){
              pump ^= 1;
            }
          }
          );
        }, child:Text('$pump'),
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 1, 20, 36)),),)
        ],
    ),
            ),
            Container(
              child:Column(
                children: [
                  Text('Check-up the tank'),
                  ElevatedButton(onPressed: isButtonDisabled ? null : (){
                    setState((){
                      
                      pump = 0;
                      inlet_on=0;
                      outlet_on=0;
                      check ^= 1;
                      checking= 'Processing';
                      
                    });
                    startTimer();
                  }, child:Text('$checking'))
                ],
              ),
            )
          ],
         )
      
      
    );
  }
}

