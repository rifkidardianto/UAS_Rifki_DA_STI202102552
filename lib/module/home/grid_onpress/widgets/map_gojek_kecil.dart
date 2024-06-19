import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

import 'google_map_widget.dart';

class MapScreenKecil extends StatelessWidget {
  const MapScreenKecil({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MapController(
      location: const LatLng(Angle.degree(-7.424920), Angle.degree(109.230339)),
      zoom: 18,
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMapWidget(
              controller: controller,
              width: double.infinity,
              height: double.infinity,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
