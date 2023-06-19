import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;

  WorldTime({this.location, this.time, this.flag, this.url});


  Future<void> timeData() async {
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/Asia/$location"));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String utc_offset = data['utc_offset'];

    DateTime now = DateTime.parse(datetime);
    //print(data['datetime']);
    //print(now);

    int hours = int.parse(data['utc_offset'].substring(1, 3));
    int minutes = int.parse(data['utc_offset'].substring(4));
    now = now.add(Duration(hours: hours, minutes: minutes));

    time = now.toString();
  }

}


