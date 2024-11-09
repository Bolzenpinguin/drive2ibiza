import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

class GeolocationService {
  final Location location = Location();

  Future<LatLng?> getUserLocation() async {
    print("Checking if location service is enabled...");
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location service is not enabled.");
        return null;
      }
    }

    print("Checking location permission...");
    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission denied.");
        return null;
      }
    }

    try {
      print("Getting user location...");
      LocationData locationData = await location.getLocation();
      print("Location obtained: ${locationData.latitude}, ${locationData.longitude}");
      return LatLng(locationData.latitude!, locationData.longitude!);
    } catch (e) {
      print("Error fetching location: $e");
      return null;
    }
  }
}