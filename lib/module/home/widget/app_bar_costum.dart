import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_uas_rifki/module/home/bloc/homeLoadingBloc/home_loading_bloc.dart';
import 'package:project_uas_rifki/module/search/view/search_view.dart';
import 'package:project_uas_rifki/shared/theme/color.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        height: 118,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          // tambahkan dekorasi lain sesuai kebutuhan
        ),
        // tambahkan dekorasi lain sesuai kebutuhan

        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent, // Menghilangkan warna latar belakang
                elevation: 0.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Warna latar belakang
                    borderRadius: BorderRadius.circular(
                        25), // BorderRadius pada latar belakang
                    border: Border.all(
                      color: Colors
                          .blueGrey[200]!, // Warna border yang telah dirubah
                    ),
                  ),
                  child: BlocBuilder<HomeLoadingBloc, HomeLoadingState>(
                    builder: (context, state) => InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: state is HomeLoaded
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SearchView(),
                                ),
                              );
                            }
                          : () {},
                      splashColor: Colors.transparent,
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Row(
                          children: [
                            SizedBox(width: 10.0),
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: Text(
                                "Cari layanan, makanan, & tujuan",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(25), // Setengah dari radius avatar
                  color: Colors.white,
                  border:
                      Border.all(color: Colors.blueGrey[200]!), // Warna border
                ),
                child: const CircleAvatar(
                  radius: 20, // Setengah dari tinggi Container
                  backgroundColor: Colors.white, // Warna latar belakang
                  child: Icon(
                    Icons.person,
                    size: 28,
                    color: CustomColor.green, // Warna ikon person
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
