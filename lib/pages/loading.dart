
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String? time = "Loading";
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: "Kolkata", flag: "india.jpg", url: 'Asia/Kolkata');
    await instance.timeData();
    //print(instance.time);

    setState(() {
      time = instance.time;
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

      body: SafeArea(child: Text("$time"), ),
    );
  }
}
