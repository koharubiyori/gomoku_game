import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomoku_game/game/index.dart';

class GamePageController extends GetxController {
  late Widget gameWidget;
  
  @override
  void onInit() {
    final game = GomokuGame();
    gameWidget = game.widget;
    
    super.onInit();
  }
}