import 'package:flutter/material.dart';
import 'package:mobileapp/handle/userPro.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _load createState() => _load();
}

const spinkit = SpinKitRotatingCircle(
  color: Color.fromARGB(255, 98, 100, 172),
  size: 50.0,
);

Future<void> receiveWaterLevel(String userId, BuildContext context) async {
  try {
    final url = Uri.parse('http://54.208.4.191/api/user/hardware/receive-water-level');
    final response = await http.post(url, body: {'userId': userId});

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      bool success = responseData['success'];
      
      if (success) {
        String water = responseData['data']['waterLevel'];
        print('$water');

        // Access the userpro provider and call setwaterlevel
        Provider.of<userpro>(context, listen: false).setwaterlevel(water);
      } else {
        // Handle unsuccessful response
        Provider.of<userpro>(context, listen: false).setwaterlevel('20');
      }
    } else {
      // Handle the error response
      print('Request failed with status 1code: ${response.statusCode}');
      Provider.of<userpro>(context, listen: false).setwaterlevel('30');
    }
  } catch (error) {
    // Handle any exceptions
    print('Request failed with error: $error');
    Provider.of<userpro>(context, listen: false).setwaterlevel('10');
  }
}

class _load extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // Define screenSize variable
    String uid = Provider.of<userpro>(context).id;
    receiveWaterLevel(uid, context);
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: screenSize.height * 0.08, // Set maximum height for the image
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        //centerTitle: true,
        actions: [
          // ignore: prefer_const_constructors
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_drop_down_sharp),
            color: Colors.black,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: spinkit,
      ),
    );
  }
}
