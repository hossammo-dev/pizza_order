import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'location_provider.dart';

class MapProvider extends ChangeNotifier {
  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  GoogleMapController? _mapController;
  GoogleMapController? get mapContrller => _mapController;

  // set setMapController(GoogleMapController controller) {
  //   _mapController = controller;
  //   notifyListeners();
  // }
  void setMapController(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  void setMarker(BuildContext context, LatLng location) {
    Provider.of<LocationProvider>(context, listen: false)
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

    _markers.add(_marker);

    final CameraPosition _position = CameraPosition(
        target: LatLng(location.latitude, location.longitude), zoom: 14.4746);

    _mapController!.animateCamera(CameraUpdate.newCameraPosition(_position));

    notifyListeners();
  }
}
