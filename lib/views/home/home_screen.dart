import 'dart:math';

import 'package:flutter/material.dart';
import 'package:for_private/core/admob/global_banner_admob.dart';
import 'package:for_private/core/enum/sound_and_lottie.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:for_private/views/home/audo_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class LottiePostion {
  double x;
  double y;
  double size;
  LottiePostion({required this.x, required this.y, required this.size});
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<LottiePostion> lottiePostion = [
    LottiePostion(x: 80, y: 100, size: 220),
    LottiePostion(x: 160, y: 300, size: 250),
    LottiePostion(x: -10, y: 280, size: 200),
  ];
  @override
  void initState() {
    super.initState();
  }

  getRandomPostion(Size screenSize) {
    lottiePostion = List.generate(SoundAndLottie.values.length, (index) {
      double size = 50 + _random.nextDouble() * 150;

      double x = _random.nextDouble() * ((index + 1) * 50) + ((index + 1) * 50);
      double y =
          _random.nextDouble() * ((index + 1) * 100) + ((index + 1) * 100);

      if (x < 0 || x > screenSize.width - 200) {
        getRandomPostion(screenSize);
      }

      if (y < 0 || y > screenSize.height - 200) {
        getRandomPostion(screenSize);
      }

      return LottiePostion(y: x, x: y, size: size);
    });
    lottiePostion = [];
  }

  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    AudoController audoController = Get.put(
      AudoController(AnimationController(vsync: this)),
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                Get.changeThemeMode(ThemeMode.light);
              } else {
                Get.changeThemeMode(ThemeMode.dark);
              }
              setState(() {});
            },
            icon: Icon(Get.isDarkMode ? Icons.brightness_2 : Icons.sunny),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [GlobalBannerAdmob()],
        ),
      ),
      // floatingActionButton: GetBuilder<AudoController>(
      //   builder: (context) {
      //     return Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         IconButton(
      //           onPressed: () {
      //             audoController.aaa();
      //           },
      //           icon: Icon(Icons.punch_clock_rounded),
      //         ),
      //         if (audoController.aa)
      //           TimerCountdown(
      //             format: CountDownTimerFormat.minutesSeconds,
      //             minutesDescription: '分',
      //             secondsDescription: '時',
      //             endTime: DateTime.now().add(
      //               Duration(minutes: 27, seconds: 34),
      //             ),
      //             onEnd: () {
      //               print("Timer finished");
      //             },
      //           ),
      //       ],
      //     );
      //   },
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<AudoController>(
                builder: (context) {
                  return Expanded(
                    child: Stack(
                      children: List.generate(SoundAndLottie.values.length, (
                        index,
                      ) {
                        SoundAndLottie soundAndLottie =
                            SoundAndLottie.values[index];

                        bool isSelected =
                            soundAndLottie == audoController.selectedLottie;

                        return Positioned(
                          left: lottiePostion[index].x,
                          top: lottiePostion[index].y,
                          child: GestureDetector(
                            onTap: () {
                              audoController.onTapLottie(soundAndLottie);
                            },
                            child: Lottie.asset(
                              fit: BoxFit.fill,
                              width: lottiePostion[index].size,
                              height: lottiePostion[index].size,
                              soundAndLottie.json,
                              animate: isSelected,
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
