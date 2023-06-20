import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map timeInfo = {};
  @override
  Widget build(BuildContext context) {
    timeInfo = ModalRoute.of(context)!.settings.arguments as Map;
    String imageBG = timeInfo['isDay'] ? 'day.png' : 'night.png';
    //print(timeInfo['isDay']);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$imageBG'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 120.0),
                  TextButton.icon(onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                      icon: const Icon(
                        Icons.edit_location,
                        color: Colors.grey,
                      ),
                      label: const Text(
                          'Change Location',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                      ),

                      //textAlign: TextAlign.center,

                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/${timeInfo['flag']}'
                        ),
                        radius: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(timeInfo['location'],
                          style: const TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                            letterSpacing: 3.0,
                          ),
                          //textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height:20.0),
                  Text(
                      timeInfo['time'],
                  style: const TextStyle(
                    fontSize: 65.0,
                    color: Colors.grey,
                  ),
                  ),

                ],
              ),
            ),
      ),

      );

  }
}


