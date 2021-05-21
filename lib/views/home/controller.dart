import 'package:get/get.dart';

class HomePageController extends GetxController {
  var mode = GameMode.solo.obs;
  var waitTime = Duration(seconds: 30).obs;
  var aiLevel = GameAILevel.normal.obs;

  GameConfig getGameConfig() {
    return GameConfig(
      mode: mode.value,
      waitTime: waitTime.value,
      aiLevel: aiLevel.value
    );
  }
}

enum GameMode {
  solo, vs
}

enum GameAILevel {
  esay, normal, hard
}

class GameConfig {
  final GameMode mode;
  final Duration waitTime;
  final GameAILevel aiLevel;

  GameConfig({
    required this.mode,
    required this.waitTime,
    required this.aiLevel
  });
}