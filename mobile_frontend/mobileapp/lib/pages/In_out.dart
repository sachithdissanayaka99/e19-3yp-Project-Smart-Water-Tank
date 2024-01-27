import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:mobileapp/handle/userPro.dart';

class In_out extends StatefulWidget {
  @override
  _in_out createState() => _in_out();
  
}

class _in_out extends State<In_out> {

  late Timer _timer;
  int inlet_on = 0;
  int outlet_on = 0;
  int pump = 0;
  String vl_state = 'ON';
  int check = 0;
  String checking = 'start check';
  bool isButtonDisabled = false;
  String uid = '';
  bool outputValve = false;
  bool inputValve = false;
  bool motorPump = false;
  double initiallevel = 0.0;
  double afterlevel = 0.0;
  

  void startTimer() async {
  initiallevel =
      double.parse(Provider.of<userpro>(context, listen: false).waterlevel);

  if (mounted) {
    setState(() {
      isButtonDisabled = true;
    });

    _timer = Timer(Duration(minutes: 1), () {
      if (mounted) {
        setState(() {
          isButtonDisabled = false;
        });

        afterlevel =
            double.parse(Provider.of<userpro>(context, listen: false).waterlevel);

        if (initiallevel == afterlevel) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Success'),
                content: Text('Tank is ok'),
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
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Success'),
                content: Text('Please check the tank, there can be a leakage'),
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
    });
  }
}

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> handleOutputValveChange() async {
    try {
      final response = await http.post(
        Uri.parse("http://54.208.4.191/api/user/hardware/send-output-valve"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode({
          "userId": uid,
          "string": "outputValve${!outputValve}",
        }),
      );
      print(response.body);
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleinputValveChange() async {
    try {
      final response = await http.post(
        Uri.parse("http://54.208.4.191/api/user/hardware/send-input-valve"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode({
          "userId": uid,
          "string": "inputValve${!inputValve}",
        }),
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> handlemotorpump() async {
    try {
      final response = await http.post(
        Uri.parse("http://54.208.4.191/api/user/hardware/send-motor-pump"),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode({
          "userId": uid,
          "string": "motorpump${!motorPump}",
        }),
      );
      print(response.body);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    uid = Provider.of<userpro>(context).id;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: screenSize.height * 0.08,
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Inlet Value',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Rubik',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (pump == 0 && check == 0) {
                        inlet_on ^= 1;
                        handleinputValveChange();
                        inputValve = !inputValve;
                      }
                    });
                  },
                  child: Text('$inlet_on'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 1, 20, 36)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Outlet Value',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Rubik',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (check == 0) {
                        outlet_on ^= 1;
                        handleOutputValveChange();
                        outputValve = !outputValve;
                      }
                    });
                  },
                  child: Text('$outlet_on'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 1, 20, 36)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Water Pump',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Rubik',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (inlet_on == 1 && check == 0) {
                        pump ^= 1;
                        handlemotorpump();
                        motorPump = !motorPump;
                      }
                    });
                  },
                  child: Text('$pump'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 1, 20, 36)),
                  ),
                )
              ],
            ),
          ),
          

Container(
  child: Align(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Check-up the tank'),
        Container(
          height: 100, // Adjust the height as needed
          width: 100,  // Adjust the width as needed
          child: ElevatedButton(
            onPressed: isButtonDisabled
                ? null
                : () {
                    setState(() {
                      pump = 0;
                      inlet_on = 0;
                      outlet_on = 0;
                      check ^= 1;
                      checking = 'Processing';
                    });
                    startTimer();
                  },
            child: Text('$checking'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 1, 20, 36)), 
              shape: MaterialStateProperty.all<CircleBorder>(
                CircleBorder(),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
),

        ],
      ),
    );
  }
}

