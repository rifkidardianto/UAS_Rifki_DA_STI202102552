import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> action = {
      "Bayar": Icons.arrow_upward,
      "Top Up": Icons.add,
      "Lainnya": Icons.more_horiz
    };
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 10),
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
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
                "assets/images/gopay_logo_rounded.png",
                width: 25,
              ),
              const SizedBox(width: 10), // Spacer
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rp100.0000",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AutoSizeText(
                    "100 coins",
                    maxLines: 1,
                    minFontSize: 8,
                    maxFontSize: 13,
                    style: TextStyle(
                      color: Color.fromARGB(255, 88, 87, 87),
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                action.length,
                (index) {
                  final iconName = action.keys.elementAt(index);
                  final iconData = action.values.elementAt(index);
                  if (iconName == "Lainnya") {
                    // Return circular icon for "Lainnya"
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Make it circular
                            color: const Color.fromARGB(255, 63, 155, 221),
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
                            child: Icon(
                              iconData,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 1.0), // Reduce spacing here
                        Text(
                          iconName,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 103, 104, 105),
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Return rectangular icon for other items
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 63, 155, 221),
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
                                  iconData,
                                  size: 17,
                                  color: Colors.white,
                                ),
                                // Ikon kedua dengan pergeseran satu piksel dalam arah yang sama dengan warna latar belakang
                                Positioned(
                                  left: 1.0,
                                  child: Icon(
                                    iconData,
                                    size: 17,
                                    color: Colors
                                        .white, // Ganti dengan warna latar belakang
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 2.0), // Reduce spacing here
                        Text(
                          iconName,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 103, 104, 105),
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
