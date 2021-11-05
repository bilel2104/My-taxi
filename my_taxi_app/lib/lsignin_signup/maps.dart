import 'dart:async';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_taxi_app/allwidget/divider.dart';
import 'package:my_taxi_app/allwidget/drawer.dart';
import 'package:my_taxi_app/assistance/ass_Methods.dart';
import 'package:my_taxi_app/datahandler/appdata.dart';
import 'package:my_taxi_app/lsignin_signup/searchscreen.dart';
import 'package:my_taxi_app/lsignin_signup/signup.dart';
import 'package:provider/provider.dart';
import 'package:slide_drawer/slide_drawer.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGooglemap;
  late Position cureentPosition;
  var geoLocator = Geolocator();
  double bottomPaddingOfmap = 0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    cureentPosition = Position();
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);
    newGooglemap.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    String address =
        await AssistentMethods.searchCoordinateAddress(position, context)
            .toString();
    print("this is your address :: " + address);
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          drawer: NavigationDrawerWidget(),
          body: Stack(
            children: [
              GoogleMap(
                padding: EdgeInsets.only(bottom: bottomPaddingOfmap),
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controllerGoogleMap.complete(controller);
                  newGooglemap = controller;
                  setState(() {
                    bottomPaddingOfmap = 265.0;
                  });
                  locatePosition();
                },
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 16.0,
                          spreadRadius: 0.5,
                          offset: Offset(0.7, 0.7)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "hi there",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "where to ?",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()),
                            );
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 6.0,
                                      spreadRadius: 0.5,
                                      offset: Offset(0.7, 0.7)),
                                ]),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Search drop off",
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Home address")
                                // Text(Provider.of<Appdata>(context)
                                //             .pickUpLocation !=
                                //         null
                                //     ? Provider.of<Appdata>(context)
                                //         .pickUpLocation
                                //         .placeName
                                //     : "add home"),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        DividerWidget(),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Icon(
                              Icons.work,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("add a work address"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
