import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:for_private/core/app_path.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

enum SoundAndLottie {
  water(AppPath.waterSound, AppPath.waterJson),
  forest(AppPath.forestSound, AppPath.forestJson),
  siren(AppPath.sirenSound, AppPath.sirenJson);

  const SoundAndLottie(this.mp3, this.json);

  final String mp3; // mp3 file name
  final String json; // json file name
}

class AudoController extends GetxController with WidgetsBindingObserver {
  final isPlaying = false.obs;
  final AudioPlayer _player = AudioPlayer();
  final AnimationController _controller;

  SoundAndLottie? selectedLottie;

  AnimationController get controller => _controller;
  AudoController(this._controller) {}
  Timer? _timer;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {}
  }

  @override
  void onInit() async {
    await _player.setReleaseMode(ReleaseMode.loop); // 🔁 반복 재생
    _player.onPlayerStateChanged.listen((PlayerState state) {
      switch (state) {
        case PlayerState.stopped:
        case PlayerState.paused:
        case PlayerState.completed:
        case PlayerState.disposed:
          isPlaying(false);
          _controller.stop();
          break;
        case PlayerState.playing:
          isPlaying(true);
      }
    });
    super.onInit();
  }

  void onTapLottie(SoundAndLottie soundAndLottie) {
    if (selectedLottie == soundAndLottie) {
      stopSound();
    } else {
      selectedLottie = soundAndLottie;
      playSound();
    }
  }

  void onLoaded(LottieComposition composition) {
    _controller.duration = composition.duration;
  }

  bool aa = true;

  void aaa() {
    aa = !aa;
    update();
  }

  playSound() async {
    await _player.play(AssetSource(selectedLottie!.mp3));
    isPlaying(true);

    update();
  }

  stopSound() async {
    selectedLottie = null;
    isPlaying(false);
    await _player.stop();
    _controller.stop();
    update();
  }
}
