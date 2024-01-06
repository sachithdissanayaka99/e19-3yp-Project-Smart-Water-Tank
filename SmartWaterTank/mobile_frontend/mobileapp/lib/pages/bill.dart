import 'package:flutter/material.dart';

class Bill extends StatefulWidget{
  @override
  _Bill createState() => _Bill();

}

class _Bill extends State<Bill>{
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
          IconButton(onPressed:(){Navigator.pushNamed(context, '/home');}, icon: Icon(Icons.arrow_drop_down_sharp)
          ,
          color: Colors.black,), ],
        backgroundColor: Colors.white,
        

      ) ,
     
         body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Your monthly bill so far:'),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.grey,
            ),
            Text('Set Monthly bill margin'),

          ],
         ),
      
      
    );
  }
}
