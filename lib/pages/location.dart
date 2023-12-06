import 'package:flutter/material.dart';
import 'package:wrold_app/classes/api-class.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<DataFromCountries> countriesList = [
    DataFromCountries(
        link: "Africa/Cairo", countryName: "Egypt - Cairo", flag: "egypt.png"),
    DataFromCountries(
        link: "Africa/Tunis",
        countryName: "Tunisia - Tunis",
        flag: "tunisia.png"),
    DataFromCountries(
        link: "Africa/Algiers",
        countryName: "Algeria - Algiers",
        flag: "algeria.png"),
    DataFromCountries(
        link: "Australia/Sydney",
        countryName: "Australia - Sydney",
        flag: "australia.png"),
    DataFromCountries(
        link: "America/Toronto",
        countryName: "Canada - Toronto",
        flag: "canada.png"),
    DataFromCountries(
        link: "Asia/Riyadh",
        countryName: "Saudi Arabia - Riyadh",
        flag: "sa.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Text("Choose Location", style: TextStyle(color: Colors.white)),
        ),
        body: Center(
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: countriesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                          onTap: () async {
                            DataFromCountries clickedCountry = countriesList[index];
                            await clickedCountry.getData();
                            Navigator.pop(context, {
                              "time": countriesList[index].time,
                              "timezone": countriesList[index].timeZone,
                              "isDay" : countriesList[index].isDay,
                            });
                          },
                          title: Text(countriesList[index].countryName,
                              style: TextStyle(fontSize: 22)),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/${countriesList[index].flag}"),
                          )));
                })
            // Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(9.0),
            //       child:
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            ));
  }
}
