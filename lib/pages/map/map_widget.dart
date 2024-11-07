import 'package:flutter/material.dart';
import 'package:drive2ibiza/utils/styleguide.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController mapController = MapController();
  // TODO noch postion laden
  final LatLng lastPostion = LatLng(51.050407, 13.737262);

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
                initialCenter: lastPostion,
                initialZoom: 17.5,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: lastPostion,
                      width: 80.0,
                      height: 200.0,
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
                mapController.move(lastPostion, 17.5);
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
              onPressed: () {
                // TODO: Geopostion bekommen
                print('BTN for Geolocation pressed');
              },
              backgroundColor: Colors.white,
              mini: true,
              child: Icon(Icons.gps_fixed, color: appPrimaryColor),
            ),
          ),


          // Search Bar and Login Button at the Bottom
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: appSecondaryColor,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Adresse',
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
                        // TODO: Noch speichern der Position hinzufügen
                        print('Location Speicher BTN gedrückt');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: paddingNormal),
                        foregroundColor: btnFontColor,
                        backgroundColor: btnBackgroundColor,
                      ),
                      child: const Text('Save Postion'),
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
}