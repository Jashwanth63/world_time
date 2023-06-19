import 'package:flutter_spinkit/flutter_spinkit.dart';
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

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time':time,
      'isDay': instance.isDay
    });

  }
  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.blue,
        ),
      ),
    );
  }
}
