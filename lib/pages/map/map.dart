  import 'package:flutter/material.dart';
  import 'package:drive2ibiza/utils/styleguide.dart';
  import 'package:flutter_map/flutter_map.dart';
  import 'package:latlong2/latlong.dart';

import 'map_widget.dart';

  class MapPage extends StatelessWidget {
    const MapPage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Map'),
        ),
        body: MapWidget(),
      );
    }
  }