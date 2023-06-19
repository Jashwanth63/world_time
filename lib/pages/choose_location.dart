import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  static int counter = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Location'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget> [
          TextButton(onPressed: () {
            setState(() {
              ++counter;
            });
          },


            child: Text('The count is $counter',
            style: const TextStyle(
              color: Colors.black,
            )),
          )
        ]
      )
    );
  }
}
