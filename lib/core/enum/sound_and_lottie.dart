import 'package:for_private/core/app_path.dart';

enum SoundAndLottie {
  water(AppPath.waterSound, AppPath.waterJson),
  forest(AppPath.forestSound, AppPath.forestJson),
  siren(AppPath.sirenSound, AppPath.sirenJson);

  const SoundAndLottie(this.mp3, this.json);

  final String mp3; // mp3 file name
  final String json; // json file name
}
