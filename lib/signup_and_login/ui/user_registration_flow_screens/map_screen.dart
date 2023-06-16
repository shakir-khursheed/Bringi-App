import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _googleMapController = Completer();
  static CameraPosition _KGooglePlex = CameraPosition(
    target: LatLng(34.09607200459733, 74.79076431842897),
    zoom: 14,
  );
  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(34.09607200459733, 74.79076431842897),
      infoWindow: InfoWindow(
        title: "Sakidafar",
      ),
    )
  ];

  @override
  void initState() {
    _marker.addAll(_list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GoogleMap(
            myLocationEnabled: true,
            markers: Set<Marker>.of(_marker),
            onMapCreated: (GoogleMapController controller) {
              _googleMapController.complete(controller);
            },
            initialCameraPosition: _KGooglePlex,
          ),
        ),
        bottomSheet: BottomSheet(
          enableDrag: false,
          onClosing: () {},
          builder: (context) => LayoutBuilder(
            builder: (p0, p1) => Container(
              height: p1.maxHeight / 4,
              width: p1.maxWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      enabled: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                        icon: Icon(Icons.location_searching),
                        onPressed: () {},
                        label: Text("use current location")),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      color: Colors.blue,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
