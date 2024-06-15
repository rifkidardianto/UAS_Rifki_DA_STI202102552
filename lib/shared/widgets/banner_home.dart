import 'package:flutter/material.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/productImages/bannerplus.jpg",
      "assets/productImages/bannerm.jpg",
    ];

    return SizedBox(
      height: 300, // Adjusted height to accommodate the content
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100), // Adjusted top space
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                  left: 0.0,
                  right: 5.0,
                  top: 10.0, // Adjusted top padding
                  bottom:
                      0.0, // Added bottom padding for spacing between images
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 1,
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
