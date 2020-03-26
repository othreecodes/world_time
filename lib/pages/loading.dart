import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();

    setState(() {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "location": instance.location,
        "flag": instance.flag,
        "time": instance.time,
        'isDayTime':instance.isDayTime
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}