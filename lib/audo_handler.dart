// audio_handler.dart
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioHandler extends BaseAudioHandler with SeekHandler {
  final _player = AudioPlayer();

  MyAudioHandler() {
    _player.playbackEventStream.listen((event) {
      playbackState.add(
        playbackState.value.copyWith(
          controls: [MediaControl.pause, MediaControl.stop],
          playing: _player.playing,
          processingState: AudioProcessingState.ready,
        ),
      );
    });
  }

  @override
  Future<void> play() => _player.play();
  @override
  Future<void> pause() => _player.pause();
  @override
  Future<void> stop() => _player.stop();

  Future<void> loadAudio(String url) async {
    await _player.setAsset(url);
    play();
  }
}
