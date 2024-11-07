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
  final MapController _mapController = MapController();
  final LatLng _initialPosition = LatLng(51.050407, 13.737262);

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
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _initialPosition,
                initialZoom: 17.5,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _initialPosition,
                      width: 80.0,
                      height: 80.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Big Circle
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icon/car.png',
                                width: 30.0,
                                height: 30.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          // Small Circle
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.green,
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
          // Reset View Button
          Positioned(
            top: 10.0,
            right: 10.0,
            child: FloatingActionButton(
              onPressed: _resetView,
              backgroundColor: Colors.white,
              child:
                  SvgPicture.asset(
                    'assets/icon/topCar.svg',
                    fit: BoxFit.contain,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void _resetView() {
    _mapController.move(_initialPosition, 17.5);
  }
}