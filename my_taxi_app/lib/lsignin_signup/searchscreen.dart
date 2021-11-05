import 'package:flutter/material.dart';
import 'package:my_taxi_app/assistance/reqassisatnce.dart';
import 'package:my_taxi_app/configMpas.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<void> taxibooking(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              titlePadding: EdgeInsets.all(0),
              title: Container(
                child: Center(
                    child: Text(
                  "Book a taxi",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                )),
                height: 80.00,
                width: 300.00,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(8, 25, 113, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              content: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 100,
                            width: 80,
                            child: Image.asset('assets/car1.jpg')),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "distance: 10 Km",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.monetization_on_outlined),
                        SizedBox(
                          width: 80,
                        ),
                        Text(
                          "price : 5.2 TND",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 200, 0),
                      child: Text(
                        "daitels :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 165, 0),
                      child: Text(
                        "rider name  :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 165, 0),
                      child: Text(
                        "Car number  :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 210, 0),
                      child: Text(
                        "Time  :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  width: 200,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Color.fromRGBO(8, 25, 113, 1),
                    child: Text("select"),
                    onPressed: () async {},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 6.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  )
                ]),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 25.0, top: 20.0, right: 25.0, bottom: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Stack(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back)),
                          Center()
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Pick Up Location",
                                  fillColor: Colors.blue[100],
                                  filled: true,
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 11.0, top: 8.0, bottom: 8.0),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          Icon(Icons.edit_location_outlined),
                          SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: TextField(
                                onChanged: (val) {
                                  findPlace(val);
                                },
                                decoration: InputDecoration(
                                  hintText: "where are you going",
                                  fillColor: Colors.blue[100],
                                  filled: true,
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 11.0, top: 8.0, bottom: 8.0),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              FloatingActionButton(
                  backgroundColor: Color.fromRGBO(8, 25, 113, 1),
                  child: Icon(Icons.car_rental_outlined),
                  onPressed: () async {
                    
                    await taxibooking(context);
                  }),
            ],
          ),
        ]),
      ),
    );
  }

  void findPlace(String placeName) async {
    if (placeName.length > 1) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890";
      var res = await ReqAssistent.getRequest(autoCompleteUrl);
      if (res == "failed") {
        return;
      }
      print("object");
      print(res);
    }
  }
}
