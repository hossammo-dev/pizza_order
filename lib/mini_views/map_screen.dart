import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizza_order/services/location_services.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Set<Marker>? _markers = {};

  // static const kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  void _setMarker(LatLng location) {
    Provider.of<LocationServices>(context, listen: false)
        .getLocation(location: location);

    Marker _marker = Marker(
      markerId: const MarkerId('location'),
      icon: BitmapDescriptor.defaultMarker,
      position: location,
      infoWindow: const InfoWindow(
        title: 'location',
        snippet: 'Your current location',
      ),
    );
    setState(() {
      _markers!.add(_marker);
    });

    final CameraPosition _position = CameraPosition(
        target: LatLng(location.latitude, location.longitude), zoom: 14.4746);

    _mapController!.animateCamera(CameraUpdate.newCameraPosition(_position));
  }

  @override
  Widget build(BuildContext context) {
    final _location =
        Provider.of<LocationServices>(context, listen: false).location;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onTap: (LatLng location) => _setMarker(location),
            initialCameraPosition: CameraPosition(
              target: LatLng(_location!.latitude, _location.longitude),
              zoom: 14.4746,
            ),
            markers: _markers!,
            mapType: MapType.hybrid,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: (controller) {
              _mapController = controller;
            },
          ),
          Positioned(
              left: 10,
              top: 30,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ))),
        ],
      ),
    );
  }
}
