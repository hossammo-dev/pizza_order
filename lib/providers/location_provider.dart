import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider extends ChangeNotifier {
  String _address = 'Access Location...';
  String get address => _address;

  LatLng? _location;
  LatLng? get location => _location;

  void getLocation({LatLng? location}) async {
    Position? _coords;
    if (location == null) {
      _coords = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    }

    _location = location ?? LatLng(_coords!.latitude, _coords.longitude);

    List<Placemark> _placemarks = await GeocodingPlatform.instance
        .placemarkFromCoordinates(_location!.latitude, _location!.longitude);

    Placemark _placemark = _placemarks[0];

    _address =
        '${_placemark.country}, ${_placemark.locality}, ${_placemark.street}';
    debugPrint(address);
    notifyListeners();
  }
}
