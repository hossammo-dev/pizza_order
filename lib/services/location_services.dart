import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationServices extends ChangeNotifier {
  String _address = 'Access Location...';
  String get address => _address;

  void getLocation() async {
    final _coords = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    List<Placemark> _placemarks = await GeocodingPlatform.instance
        .placemarkFromCoordinates(_coords.latitude, _coords.longitude);

    Placemark _placemark = _placemarks[0];

    _address =
        '${_placemark.country}, ${_placemark.locality}, ${_placemark.street}';
        debugPrint(address);
    notifyListeners();
  }
}
