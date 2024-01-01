import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/In_out.dart';
import 'pages/Tank.dart';
import 'pages/bill.dart';
import 'pages/loading.dart';
import 'pages/usage.dart';
import 'Auth/login.dart';
import 'Auth/signup.dart';

// ignore: prefer_const_constructors
void main() =>runApp(MaterialApp(
  initialRoute: '/login',
  routes:{
    
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/tank':(context) => Tank(),
    '/inout':(context) =>In_out(),
    '/bill':(context) => Bill(),
    '/usage':(context) => Usage(),
    '/login':(context) => const Login(),
    '/signin':(context) => const Signup(),
  }
));


