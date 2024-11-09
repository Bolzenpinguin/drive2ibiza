import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

class GeolocationService {
  final Location location = Location();

  // check if GPS is enabled 
  Future<LatLng?> getUserLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    // check permissions
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    // try to get the location and send it back
    try {
      LocationData locationData = await location.getLocation();
      return LatLng(locationData.latitude!, locationData.longitude!);
    } catch (e) {
      print("Error fetching location: $e");
      return null;
    }
  }
}