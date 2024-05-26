import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_uas_rifki/shared/blocs/buildPageCubit/build_page_cubit.dart';
import 'package:project_uas_rifki/shared/theme/color.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> bottomNavbar = {
      "Beranda": "assets/images/beranda.png",
      "Promo": "assets/images/promo.png",
      "Pesanan": "assets/images/pesanan.png",
      "Chat": "assets/images/chat.png"
    };

    double tabWidth =
        MediaQuery.of(context).size.width / bottomNavbar.length - 5;
    return Positioned(
        bottom: 0,
        left: 0,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: BlocBuilder<BuildPageCubit, BottomNavBarTab>(
                builder: (context, state) {
              double animationPosition =
                  context.read<BuildPageCubit>().handleAnimationBar(tabWidth);

              return Stack(fit: StackFit.expand, children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(bottomNavbar.length, (index) {
                      bool isSelectedPage =
                          state == BottomNavBarTab.values[index];
                      return GestureDetector(
                        onTap: () => context
                            .read<BuildPageCubit>()
                            .selectPage(BottomNavBarTab.values[index]),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          height: 70,
                          width: tabWidth,
                          decoration: isSelectedPage
                              ? const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                      Color.fromARGB(5, 0, 255, 8),
                                      Color.fromARGB(106, 255, 255, 255),
                                      Color.fromARGB(87, 255, 255, 255),
                                    ]))
                              : const BoxDecoration(
                                  color: Colors.white,
                                ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              bottomNavbar.values.elementAt(index) is String
                                  ? Image.asset(
                                      bottomNavbar.values.elementAt(index),
                                      color: isSelectedPage
                                          ? CustomColor.darkGreen
                                          : Colors.grey[750],
                                      height: 25,
                                      width: 25,
                                    )
                                  : Icon(
                                      bottomNavbar.values.elementAt(index),
                                      color: isSelectedPage
                                          ? CustomColor.darkGreen
                                          : const Color.fromARGB(
                                              255, 138, 138, 138),
                                      size: 25,
                                    ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              AutoSizeText(
                                bottomNavbar.keys.elementAt(index),
                                minFontSize: 8,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 10,
                                    color:
                                        state == BottomNavBarTab.values[index]
                                            ? CustomColor.darkGreen
                                            : Colors.black),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: 0,
                  left: animationPosition,
                  child: Container(
                    height: 5,
                    width: tabWidth,
                    decoration: const BoxDecoration(
                        color: CustomColor.darkGreen,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  ),
                )
              ]);
            })));
  }
}
