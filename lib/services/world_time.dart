import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String time; //time in location
  String flag; //url to asset
  String url; //location url
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //API is down. :(
//    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
//    print(response.body);
//    print(response.statusCode);
//    Map data = jsonDecode(response.body);
//    print(data);
//    print(data['title']);
      await Future.delayed(Duration(seconds: 1));
      String datetime = "2020-03-25 03:26:18.140964";
      String offset = "+01:00".substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "could not get time";
    }
  }
}
