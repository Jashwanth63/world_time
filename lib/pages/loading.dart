import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void timeData() async {
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Kolkata"));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String utc_offset = data['utc_offset'];

    DateTime now = DateTime.parse(datetime);
    //print(data['datetime']);
    print(now);

    int hours = int.parse(data['utc_offset'].substring(1, 3));
    int minutes = int.parse(data['utc_offset'].substring(4));
    now = now.add(Duration(hours: hours, minutes: minutes));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    timeData();
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(

      body: SafeArea(child: Text("Loading Screen"), ),
    );
  }
}
