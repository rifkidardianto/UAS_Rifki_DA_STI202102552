import 'package:flutter/material.dart';
import '../widgets/map_gojek.dart';

class GoRideView extends StatelessWidget {
  const GoRideView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/backgroundgoo.jpg'), // Ganti dengan path gambar background Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              // Mengatur alignment ke Alignment.center untuk mengecilkan MapScreen agar backgroundnya terlihat
              child: Align(
                alignment: const Alignment(0, -0.15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.95, // Mengatur lebar MapScreen ke 80% dari lebar layar
                    height: MediaQuery.of(context).size.height *
                        0.5, // Mengatur tinggi MapScreen ke 80% dari tinggi layar
                    child: const MapScreen(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
