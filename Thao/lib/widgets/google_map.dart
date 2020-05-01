
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/maps_provider.dart';



class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  bool isClickButton = false;
  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(13.7315172,108.0598776),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    final maps = Provider.of<MapProvider>(context);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                GoogleMap(
                  myLocationEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: initialLocation,
                  markers: Set.of((maps.marker != null) ? [maps.marker] : []),
                  circles: Set.of((maps.circle != null) ? [maps.circle] : []),
                  onMapCreated: (GoogleMapController controller) {
                    maps.controller = controller;
                  },

                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(300, 240, 10, 0),
                  child: FloatingActionButton(
                      child: Icon(Icons.location_searching),
                      onPressed: () {
                        print("click");
                        maps.getCurrentLocation(context);
                      }),
                ),
              ],
            ),
          ),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Text(isClickButton ? "STOP":"START", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16),),
            onPressed: (){
              setState(() {
                isClickButton = !isClickButton;
              });
              if(isClickButton == true){
                maps.getCurrentLocation(context);
              }
            },
          ),
        ],
      )
    );
  }
}
