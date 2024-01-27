import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobileapp/handle/userPro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  String uid= '';
  
Future<void> getWaterLevelModels(String userId) async {
  try {
    final url = Uri.parse('http://54.208.4.191/api/user/hardware/tank-exits?userId=$userId');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      if (response.headers['content-type']?.contains('application/json') ?? false) {
        // Parse the JSON response
        final jsonResponse = json.decode(response.body);
        // Handle the response data
        print('Request successful: $jsonResponse');
      } else {
        // Handle the error response
        print('Request failed with unexpected response format');
        //print('Response type: ${jsonResponse.runtimeType}');
      }
    } else {
      // Handle the error response
      print('Request failed with status code: ${response.statusCode}');

    }
  } catch (error) {
    // Handle any exceptions
    print('Request failed with error: $error');
  }
}
Future<void> registerUser(String tankId,String uid) async {
  try {
    final url = Uri.parse('http://54.208.4.191/api/user/hardware/tank-registration');
    final response = await http.post(
      url,
      body: json.encode({'tankId': tankId,
      'userId': uid,}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // Handle the successful response
      print('Response: $jsonResponse');
    } else {
      // Handle the error response
      print('Request failed with status code: ${response.body}');
    }
  } catch (error) {
    // Handle any exceptions
    print('Request failed with error: $error');
  }
}
  @override
  Widget build(BuildContext context){
    final screenSize = MediaQuery.of(context).size; // Define screenSize variable
    final TextEditingController _tankController = TextEditingController();
    String user= Provider.of<userpro>(context).name;
    String uid= Provider.of<userpro>(context).id;
    String tid=_tankController.text;
   
    getWaterLevelModels(uid);
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
            Navigator.pushNamed(context, '/home');  
            
          }, icon: Icon(Icons.arrow_drop_down_sharp)
          ,
          color: Colors.black,), ],
        backgroundColor: Colors.white,
        

      ) ,
    
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Hello $uid',style: TextStyle(
            fontSize: 30,
            fontFamily: 'Rubik',
          ),),
          TextField(
              controller: _tankController,
              decoration: InputDecoration(
                labelText: 'your tank id',
              ),
           
            ),
 ElevatedButton(onPressed:(){
               registerUser(tid,uid);
             
                
             }, child: Text('register')),

             TextButton(onPressed: (){
              Navigator.pushNamed(context, '/login');
             }, child: Text('Login'))

          
        ],
    ),
    );
    

      
}
}
