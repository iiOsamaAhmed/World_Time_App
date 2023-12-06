import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wrold_app/classes/api-class.dart';

class Loding extends StatefulWidget {
  const Loding({super.key});

  @override
  State<Loding> createState() => _LodingState();
}

class _LodingState extends State<Loding> {
  getDataForLoding() async {
    DataFromCountries data = DataFromCountries(link: "Africa/Cairo", countryName: "Egypt - Cairo", flag: "egypt.png");
    await data.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": data.time,
      "timezone": data.timeZone,
      "isDay": data.isDay,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataForLoding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.grey[800],
          size: 50.8,
        ),
      ),
    );
  }
}
