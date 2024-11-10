import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:drive2ibiza/utils/styleguide.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:drive2ibiza/services/geolocation.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController mapController = MapController();
  final LatLng lastPosition = LatLng(51.050407, 13.737262);
  LatLng? markerPosition;
  final GeolocationService geolocationService = GeolocationService();

  @override
  void initState() {
    super.initState();
    markerPosition = lastPosition; // Initially set marker at the lastPosition
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(marginSmall),
      decoration: BoxDecoration(
        color: whiteBackground,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 20,
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: lastPosition,
                initialZoom: 17.5,
                onTap: (tapPosition, point) {
                  // Update marker position to where the map was tapped
                  setState(() {
                    markerPosition = point;
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: [
                    if (markerPosition != null)
                      Marker(
                        point: markerPosition!,
                        width: 80.0,
                        height: 100.0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icon/car.svg',
                                  fit: BoxFit.contain,
                                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  markerPosition = lastPosition;
                });
                mapController.move(lastPosition, 17.5);
              },
              backgroundColor: Colors.white,
              mini: true,
              child: SvgPicture.asset(
                'assets/icon/topCar.svg',
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(appPrimaryColor, BlendMode.srcIn),
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            right: 10.0,
            child: FloatingActionButton(
              onPressed: () async {
                // Fetch the user location
                LatLng? userLocation = await geolocationService.getUserLocation();

                if (userLocation != null) {
                  // Update marker position and move the map to the users location
                  setState(() {
                    markerPosition = userLocation;
                  });
                  mapController.move(userLocation, 17.5);
                }
              },
              backgroundColor: Colors.white,
              mini: true,
              child: Icon(Icons.gps_fixed, color: appPrimaryColor),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    onSubmitted: (address) async {
                      await searchAndMoveToAddress(address);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: appSecondaryColor,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appUnselectedIconColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appUnselectedIconColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: settingsBoxWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        _showMyDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: paddingNormal),
                        foregroundColor: btnFontColor,
                        backgroundColor: btnBackgroundColor,
                      ),
                      child: const Text('Save Position'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text('Saved Position!'), // Centering the title text
          ),
          actionsAlignment: MainAxisAlignment.center, // Center-aligning the actions
          actions: <Widget>[
            TextButton(
              child: const Text('Okay!', style: TextStyle(color: appPrimaryColor),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> searchAndMoveToAddress(String address) async {
    LatLng newLocation = await searchForAddress(address);
    setState(() {
      markerPosition = newLocation;
    });
    mapController.move(newLocation, 17.5);
  }

  Future<LatLng> searchForAddress(String address) async {
    final response = await http.get(
      Uri.parse('https://nominatim.openstreetmap.org/search?q=$address&format=json&limit=1'),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        double lat = double.parse(data[0]['lat']);
        double lon = double.parse(data[0]['lon']);
        return LatLng(lat, lon);
      }
    }
    return lastPosition; // Fallback to the lastPosition
  }
}