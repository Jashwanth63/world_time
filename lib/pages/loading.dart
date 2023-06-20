import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map LocationInfo = {
    'location':"Kolkata",
    'flag' : "India.jpg",
   'url' : "Asia/Kolkata"
  };


  String? time = "Loading";
  void setUpWorldTime({location, flag, url}) async {

    WorldTime instance = WorldTime(location: location, flag: flag, url: url);
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

    setUpWorldTime(
        location: LocationInfo['location'],
    flag: LocationInfo['flag'],
    url: LocationInfo['url']);
  }

  @override
  Widget build(BuildContext context) {
    //LocationInfo = ModalRoute.of(context)!.settings.arguments as Map;
    //initState();
    return const Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.blue,
        ),
      ),
    );
  }
}
