import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomoku_game/views/game/controller.dart';
import 'package:gomoku_game/views/home/controller.dart';

class GamePageArgs {
  late GameConfig config;

  GamePageArgs({
    required this.config
  });
}

class GamePage extends StatelessWidget {
  GamePage({Key? key}) : super(key: key);
  final GamePageArgs routeParams = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(GamePageController());
    return c.gameWidget;
  }
}