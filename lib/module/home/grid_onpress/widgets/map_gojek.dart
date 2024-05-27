// map_screen.dart
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:sheet/sheet.dart';

import 'delivery_modal_content.dart';
import 'google_map_widget.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MapController(
      location: const LatLng(Angle.degree(-7.424920), Angle.degree(109.230339)),
      zoom: 18,
    );

    return Scaffold(
      body: Stack(
        children: [
          // Atur ukuran GoogleMapWidget sesuai kebutuhan
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GoogleMapWidget(
              controller: controller,
              width: double.infinity,
              height: double.infinity,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Sheet(
            initialExtent: 300,
            minExtent: 60,
            maxExtent: 300,
            child: DeliveryModalContent(),
          ),
        ],
      ),
    );
  }
}
