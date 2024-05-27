import 'package:flutter/material.dart';

import '../grid_onpress/screens/go_ride_view.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, List<dynamic>> gridMap = {
      "GoRide": ["assets/gridHeader/go_ridein.png", Colors.transparent],
      "GoCar": ["assets/gridHeader/go_carin.png", Colors.transparent],
      "GoFood": ["assets/gridHeader/go_foodd.png", Colors.transparent],
      "GoSend": ["assets/gridHeader/go_send.png", Colors.transparent],
      "GoMart": ["assets/gridHeader/go_martd.png", Colors.transparent],
      "GoTagihan": ["assets/gridHeader/go_tagihan.png", Colors.transparent],
      "GoShop": ["assets/gridHeader/go_shop.png", Colors.transparent],
      "Lainnya": ["assets/gridHeader/lainnya.png", Colors.transparent],
    };
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemCount: gridMap.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // Navigasi sesuai dengan gambar yang ditekan
            switch (gridMap.keys.elementAt(index)) {
              case "GoRide":
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GoRideView()),
                );
                break;
              case "GoCar":
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GoRideView()),
                );
                break;
              // Tambahkan case lain jika diperlukan
              default:
                // Do nothing for other cases
                break;
            }
          },
          child: Column(
            children: [
              Container(
                height: 60, // Ubah tinggi ikon
                width: 60, // Ubah lebar ikon
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: gridMap.values.elementAt(index)[1],
                ),
                child: Center(
                  child: Image.asset(
                    "${gridMap.values.elementAt(index)[0]}",
                    height: 60, // Ubah tinggi ikon
                    width: 60, // Ubah lebar ikon
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                gridMap.keys.elementAt(index),
                style:
                    const TextStyle(fontWeight: FontWeight.w100, fontSize: 13),
              )
            ],
          ),
        ),
      ),
    );
  }
}
