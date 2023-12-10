import 'package:flutter/material.dart';

class In_out extends StatefulWidget{
  @override
  _in_out createState() => _in_out();
}

class _in_out extends State<In_out>{
  @override
  Widget build(BuildContext context){
    final screenSize = MediaQuery.of(context).size; // Define screenSize variable
    return Scaffold(
      backgroundColor: Colors.blue[100],
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
         body: Text('under construction'),
      
      
    );
  }
}