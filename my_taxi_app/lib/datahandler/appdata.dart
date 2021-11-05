import 'package:flutter/cupertino.dart';
import 'package:my_taxi_app/modles/address.dart';

class Appdata extends ChangeNotifier {
   Address? pickUpLocation;
  void updatepickupaddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}
