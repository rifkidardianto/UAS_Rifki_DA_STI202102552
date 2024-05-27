import 'package:flutter/material.dart';

class LocationIndicator extends StatelessWidget {
  final Color? bgColor;
  final Color? color;

  const LocationIndicator({
    super.key,
    required this.bgColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
