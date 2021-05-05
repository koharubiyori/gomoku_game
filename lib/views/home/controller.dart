import 'package:get/get.dart';

class HomePageController extends GetxController {
  var mode = GameMode.solo.obs;

  toggleMode() {
    mode.value = mode.value == GameMode.solo ? GameMode.vs : GameMode.solo;
  }
}

enum GameMode {
  solo, vs
}