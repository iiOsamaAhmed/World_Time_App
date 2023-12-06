import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class DataFromCountries {

  String countryName = "";
  String flag = "";
  String link = "";
  
  DataFromCountries({required this.countryName, required this.flag, required this.link});

  late String time;
  late String timeZone;
  late bool isDay;

  getData() async {
    Response response = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map receivedData = jsonDecode(response.body);

    DateTime receivedDateTime = DateTime.parse(receivedData["utc_datetime"]);
    int receivedOffset = int.parse(receivedData["utc_offset"].substring(0, 3));

    DateTime realDateTime =
        receivedDateTime.add(Duration(hours: receivedOffset));

    time = DateFormat("hh:mm a").format(realDateTime);
    timeZone = receivedData["timezone"];

    if (realDateTime.hour > 6 && realDateTime.hour < 18) {
      isDay = true;
    } else {
      isDay = false;
    }
  }
}
