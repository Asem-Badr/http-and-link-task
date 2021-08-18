import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:httptask/models/user.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapSample extends StatefulWidget {
  Geo myLocation;
  MapSample({this.myLocation});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition initLocation;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  void initState() {
    super.initState();
    initLocation = CameraPosition(
      target: LatLng(
        double.parse(widget.myLocation.lat),
        double.parse(widget.myLocation.lng),
      ),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: openLocation,
        label: Text('View Lake !'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  openLocation() {
    MapsLauncher.launchCoordinates(
      double.parse(widget.myLocation.lat),
      double.parse(widget.myLocation.lng),
    );
  }
}
