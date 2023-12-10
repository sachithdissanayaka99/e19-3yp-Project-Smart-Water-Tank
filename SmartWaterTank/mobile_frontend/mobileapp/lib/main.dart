import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/In_out.dart';
import 'pages/Tank.dart';
import 'pages/bill.dart';
import 'pages/loading.dart';
import 'pages/usage.dart';


// ignore: prefer_const_constructors
void main() =>runApp(MaterialApp(
  initialRoute: '/home',
  routes:{
    
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/tank':(context) => Tank(),
    '/inout':(context) =>In_out(),
    '/bill':(context) => Bill(),
    '/usage':(context) => Usage(),
  }
));

