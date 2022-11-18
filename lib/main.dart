import 'package:flutter/material.dart';
import 'package:worled_time/pages/chooose_location.dart';
import 'package:worled_time/pages/home.dart';
import 'package:worled_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/home': (context) => Home(),
      '/location': (context) => chooosLocation(),
      '/': (context) => Loading()
    },
  ));
}
