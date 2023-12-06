// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map receivedData = {};
  @override
  Widget build(BuildContext context) {
    receivedData = receivedData.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : receivedData;

    String image = "";
    if (receivedData["isDay"] == true) {
      image = "assets/day.png";
    } else {
      image = "assets/night.png";
    }

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          color: Colors.grey[800],
          image:
              DecorationImage(image: AssetImage("$image"), fit: BoxFit.cover)),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.cyan[700]),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 18, horizontal: 20))),
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, '/location');
                setState(() {
                  if (result == null) {
                    receivedData = {
                      "time": "...",
                      "timezone": "Please Choose a Location",
                      "isDay": false
                    };
                  } else {
                    receivedData = result;
                  }
                });
              },
              icon: Icon(
                Icons.location_off,
                color: Colors.red,
              ),
              label: Text(
                "Get Location",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 400),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              width: double.infinity,
              decoration: BoxDecoration(color: Color.fromARGB(121, 0, 0, 0)),
              child: Column(
                children: [
                  Text("${receivedData["time"]}",
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                  SizedBox(height: 15),
                  Text("${receivedData["timezone"]}",
                      style: TextStyle(fontSize: 25, color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
