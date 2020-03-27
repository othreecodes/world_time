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
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset.substring(1,3))));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = "could not get time";
    }
  }
}
