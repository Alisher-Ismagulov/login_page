import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng aLocation = LatLng(43.237290113421004, 76.91213079644109);
  static const LatLng bLocation = LatLng(43.196960163051415, 76.89396391552762);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(43.21534401515193, 76.89917253775292),
    zoom: 13.4746,
  );


  static final Marker _kGooglePlexMarker = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: "A"),
      icon: BitmapDescriptor.defaultMarker,
      position: aLocation);


  static final Marker _kSecposMarker = Marker(
      markerId: MarkerId('_kSecposPlex'),
      infoWindow: InfoWindow(title: "B"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: bLocation);


  static final Polyline _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [aLocation, bLocation],
      width: 4,
      color: Colors.blueAccent);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {_kGooglePlexMarker, _kSecposMarker},
        polylines: {_kPolyline},
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}