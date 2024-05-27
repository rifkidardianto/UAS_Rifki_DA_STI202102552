// widgets/google_map_widget.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:map/map.dart';

class GoogleMapWidget extends StatelessWidget {
  final MapController controller;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const GoogleMapWidget({
    super.key,
    required this.controller,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        width: width,
        height: height,
        child: MapLayout(
          controller: controller,
          builder: (context, transformer) {
            return TileLayer(
              builder: (context, x, y, z) {
                final tilesInZoom = pow(2.0, z).floor();

                while (x < 0) {
                  x += tilesInZoom;
                }
                while (y < 0) {
                  y += tilesInZoom;
                }

                x %= tilesInZoom;
                y %= tilesInZoom;

                // Google Maps URL
                final url =
                    'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                return CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
