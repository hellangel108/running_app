import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapProvider with ChangeNotifier {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  LocationData _locationData;
  GoogleMapController _controller;

  //GoogleMapController get controller => _controller;
  set controller(GoogleMapController value) {
    _controller = value;
  }

  LocationData get locationData => _locationData;
  Marker marker;
  Circle circle;
  void updateMarkerAndCircle(LocationData newLocalData, BuildContext context)async {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    marker = Marker(
        markerId: MarkerId("home"),
        position: latlng,
        rotation: newLocalData.heading,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
        icon: await BitmapDescriptor.fromAssetImage(createLocalImageConfiguration(context), 'assets/pngwave.png'));
    notifyListeners();
    circle = Circle(
        circleId: CircleId("step"),
        radius: newLocalData.accuracy,
        zIndex: 1,
        strokeColor: Colors.blue,
        center: latlng,
        fillColor: Colors.blue.withAlpha(70));
    notifyListeners();
  }
  Future<void> getCurrentLocation(BuildContext context) async {
      try {
        var location = await _locationTracker.getLocation();
        updateMarkerAndCircle(location, context);
        if (_locationSubscription != null) {
          _locationSubscription.cancel();
        }
        _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) {
          if (_controller != null) {
            _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(newLocalData.latitude, newLocalData.longitude),
                zoom: 15.00)));
           notifyListeners();
          }
        });

      }on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          debugPrint("Permission Denied");
        }
      }
    }
    void dispose(){
    marker = null;
    circle = null;
    super.dispose();
    }
}