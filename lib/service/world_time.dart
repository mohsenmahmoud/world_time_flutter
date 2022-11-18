import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  worldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response responce = await http.get(Uri.parse(
          'https://www.timeapi.io/api/Time/current/zone?timeZone=$url'));

      Map data = jsonDecode(responce.body);
      print(data);

      String dateTime = data['dateTime'];
      DateTime now = DateTime.parse(dateTime);

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
      print(now);
    } catch (e) {
      print(e);
      time = 'coud not loading time';
    }
  }
}
