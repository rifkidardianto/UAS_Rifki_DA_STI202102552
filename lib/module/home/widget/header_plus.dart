import 'package:flutter/material.dart';

class HeaderPlus extends StatelessWidget {
  const HeaderPlus({super.key, required double height});

  @override
  Widget build(BuildContext context) {
    List<IconData> actions = [Icons.arrow_forward];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 8),
      height: 30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.green[800],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.0),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/logo_plus.png",
                width: 20,
              ),
              const SizedBox(width: 10), // Spacer
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Diskon s.d. 12rb/transaksi. Yuk, langganan",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                actions.length,
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 18, // adjusted size
                      width: 18, // adjusted size
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            // Ikon utama dengan warna yang Anda inginkan
                            Icon(
                              actions[index],
                              size:
                                  15, // disesuaikan dengan ukuran yang diinginkan
                              color: Colors.green[800],
                            ),
                            // Ikon kedua dengan pergeseran satu piksel dalam arah yang sama dengan warna latar belakang
                            Positioned(
                              left: 1.0,
                              child: Icon(
                                actions[index],
                                size:
                                    15, // disesuaikan dengan ukuran yang diinginkan
                                color: Colors.green[
                                    800], // Ganti dengan warna latar belakang
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
