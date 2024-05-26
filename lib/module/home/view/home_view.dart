import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_uas_rifki/module/home/bloc/homeLoadingBloc/home_loading_bloc.dart';
import 'package:project_uas_rifki/module/home/widget/app_bar_costum.dart';
import 'package:project_uas_rifki/module/home/widget/event.dart';
import 'package:project_uas_rifki/module/home/widget/header_plus.dart';
import 'package:project_uas_rifki/module/home/widget/shimmer.dart';
import 'package:project_uas_rifki/shared/widgets/banner_gopay_later.dart';
import 'package:project_uas_rifki/shared/widgets/gopay_later.dart';
import 'package:project_uas_rifki/shared/widgets/banner_home.dart';
import 'package:project_uas_rifki/module/home/widget/grid_view_widget.dart';
import 'package:project_uas_rifki/module/home/widget/header.dart';
import 'package:project_uas_rifki/module/home/widget/recommendation_place.dart';

import '../data/event_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            BlocBuilder<HomeLoadingBloc, HomeLoadingState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const BannerHome(),
                        const SizedBox(height: 0.0),
                        const Header(),
                        const SizedBox(height: 25.0),
                        const GridViewWidget(),
                        const HeaderPlus(height: 30.0),
                        const BannerGopayLater(),
                        const SizedBox(height: 15.0),

                        const SizedBox(
                            height:
                                20.0), // Jarak tambahan di atas RecommendationPlace
                        const RecommendationPlace(),
                        const SizedBox(height: 30.0),
                        const GopayLater(
                          title: "Lebih Ringan tiap Senin 🤩",
                          description:
                              "Karena ada traktiran cicilan 3 bulan 0% Gopay Later di Tokopedia + BEBAS ongkir dengan min. belanja 100RB.",
                        ),
                        Column(
                          children: List.generate(
                            eventContent.length,
                            (index) => Event(
                              image: eventContent[index]['image'],
                              title: eventContent[index]["title"],
                              description: eventContent[index]["description"],
                            ),
                          ),
                        ),
                        const SizedBox(height: 80.0),
                      ],
                    ),
                  );
                } else if (state is HomeLoading) {
                  return const HomeShimmer();
                } else {
                  return Container();
                }
              },
            ),
            const AppBarCustom(),
          ],
        ),
      ),
    );
  }
}
