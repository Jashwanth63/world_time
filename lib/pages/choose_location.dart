import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'India.png'),
  ];

  void getNewTime({url, location, flag}) async{
    WorldTime getTime = WorldTime(url:url, location:location, flag: flag);
    await getTime.timeData();
    Navigator.pushReplacementNamed(context,
      '/home',
      arguments: {
        'location' : getTime.location,
        'flag' : getTime.flag,
        'time' : getTime.time,
        'isDay' : getTime.isDay
      }
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              onTap: () {
                getNewTime(
                    url: locations[index].url,
                    location: locations[index].location,
                    flag: locations[index].flag,
                );
              },
              title: Text(
                '${locations[index].location}',
              style: TextStyle(
                  letterSpacing: 1.5,
              ),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },

      ),

    );
  }
}
