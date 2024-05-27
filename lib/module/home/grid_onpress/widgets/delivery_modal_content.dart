import 'package:flutter/material.dart';

class DeliveryModalContent extends StatelessWidget {
  const DeliveryModalContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.blue, // Ganti warna ikon sesuai keinginan
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for a destination',
                      hintStyle:
                          TextStyle(color: Colors.grey), // Warna teks hint
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black), // Warna teks input
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8), // Moved SizedBox inside the Column
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Save an address for a faster booking',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Any frequently used address? Let’s save it & never type it ever again!',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                        height:
                            16), // Adding some space between the text and buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.home, color: Colors.black),
                          label: const Text(
                            'Home Work',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8), // Memberi jarak antara tombol
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.work, color: Colors.black),
                          label: const Text(
                            'Save Work',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors
                                .white, // Warna teks dan ikon saat tombol ditekan
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
