import 'package:flutter/material.dart';

class BannerGopayLater extends StatelessWidget {
  const BannerGopayLater({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/productImages/bannergopaylater.jpg",
    ];

    return SizedBox(
      height: 200, // Adjusted height to accommodate the content
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15), // Adjusted top space
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 0.0,
                  top: 5.0, // Adjusted top padding
                  bottom:
                      0.0, // Added bottom padding for spacing between images
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.93,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
