import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:mobileapp/handle/userPro.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      final response = await http.post(
        Uri.parse('http://54.208.4.191/api/user/login'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      final responseData = json.decode(response.body);
      print(responseData);

      if (response.statusCode == 200 && responseData['success']) {
        print(responseData['message']);
        //final userId = responseData['data']['userId'];
        final token = responseData['data']; // Extract the token from the response
        //print('user: $userId');
        //// Store the token for future use
        // You can use a state management solution like Provider or Riverpod to store the token globally
        // For simplicity, I'll store it in shared preferences
        // Make sure to import the shared_preferences package
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        getUserInfoById(token);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('User logged in successfully'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ],
            );
          },
        );
      } else if (response.statusCode == 200 && !responseData['success']) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Invalid email or password'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Error logging in: ${responseData['message']}'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error: $e'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> getUserInfoById(String token) async {
  print('user in: $token');
  const url = 'http://54.208.4.191/api/user/get-user-info-by-id';
  final response = await http.post(
    Uri.parse(url),
    headers: {
     'Authorization': 'Bearer $token',
    },
    body: {
      'token': token,
    },
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    final success = responseData['success'];
    final data = responseData['data'];
    final userID= responseData['data']['_id'];
    final name=responseData['data']['fullName'];
    

    if (success) {
      // User exists, handle the data
      print('User Info: $data');
      print('User ID: $name');
      Provider.of<userpro>(context, listen: false).setuser(userID); 
    } else {
      // User doesn't exist
      final message = responseData['message'];
      print('User Info Error: $message');
    }

  }
  else{
    print('User Info Error: ${response.statusCode}');
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 238, 248),
      
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              width:250,
              height:250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              
              ),
            //Text('Login', style: TextStyle(fontSize: 32.0),),
            Container(
              margin: EdgeInsets.symmetric (horizontal: 20.0, vertical: 2.0),
              padding: EdgeInsets.symmetric ( horizontal: 20.0, vertical: 0.0),
              decoration: BoxDecoration(
     borderRadius: BorderRadius.only(
      topLeft: Radius.circular(0.0),
      topRight: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
    ),
    border: Border.all(
      color: Color.fromARGB(195, 22, 7, 36),
      width: 1.0,
    ),
  ),
            child:TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              
            ),),
             Container(
              margin: EdgeInsets.symmetric (horizontal: 20.0, vertical: 2.0),
              padding: EdgeInsets.symmetric ( horizontal: 20.0, vertical: 0.0),
              decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(0.0),
      topRight: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
    ),
    border: Border.all(
      color: Color.fromARGB(195, 22, 7, 36),
      width: 1.0,
    ),
  ),
            child:TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),),
           Container(
              width:150,
              height:40,
              margin: EdgeInsets.symmetric ( horizontal:20.0,vertical: 0.0  ),
              padding: EdgeInsets.symmetric ( horizontal: 20.0, vertical: 0.0),
              decoration: BoxDecoration(
                
    
    ),
           
            child:ElevatedButton(
              onPressed: loginUser,
              child: Text('Login'),
              style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
       borderRadius: BorderRadius.only(
      topLeft: Radius.circular(0.0),
      topRight: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
    ),// Set the corner curve here
      ),
    )))),
            Container(
              width:150,
              height:40,
              margin: EdgeInsets.all ( 10.0),
              padding: EdgeInsets.symmetric ( horizontal: 20.0, vertical: 0.0),
              decoration: BoxDecoration(),
            child:ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: Text('Sign Up'),
               style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
       borderRadius: BorderRadius.only(
      topLeft: Radius.circular(0.0),
      topRight: Radius.circular(30.0),
      bottomLeft: Radius.circular(30.0),
      bottomRight: Radius.circular(30.0),
    ),// Set the corner curve here
      ),
    ))
            ),),
          ],
        ),
      ),
    );
  }
}