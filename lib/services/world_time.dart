import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDay;
  WorldTime({this.location, this.time, this.flag, this.url});


  Future<void> timeData() async {
    try {
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Asia/$location"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String utc_offset = data['utc_offset'];
      //print(datetime);
      DateTime now = DateTime.parse(datetime);

      //print(data['datetime']);
      //print(now);

      int hours = int.parse(utc_offset.substring(1, 3));
      int minutes = int.parse(utc_offset.substring(4));
      now = now.add(Duration(hours: hours, minutes: minutes));
      isDay = (now.hour>6 && now.hour<18) ? true:false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print(e.toString());
      time = "Get request Failed";
    }

  }

}


