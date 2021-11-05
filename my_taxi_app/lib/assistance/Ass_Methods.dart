

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_taxi_app/assistance/reqassisatnce.dart';
import 'package:my_taxi_app/configMpas.dart';
import 'package:http/http.dart' as http;
import 'package:my_taxi_app/datahandler/appdata.dart';
import 'package:my_taxi_app/modles/address.dart';
import 'package:provider/provider.dart';

class AssistentMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    late String placesAdress;
    String url =
        "http://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";
    var response = await ReqAssistent.getRequest(url);
    if (response != "failed") {
      // placesAdress = response["results"];
      placesAdress = response["results"][0]["formatted_address"];

      // Address userPickUpAddress = new Address();
      // userPickUpAddress.latitude = position.latitude;
      // userPickUpAddress.longitude = position.longitude;
      // userPickUpAddress.placeName = placesAdress;
      // Provider.of<Appdata>(context, listen: false)
      //     .updatepickupaddress(userPickUpAddress);
    }
    return placesAdress;
  }
}
