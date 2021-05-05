import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomoku_game/routes/index.dart';
import 'package:gomoku_game/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '五子棋',
      initialRoute: '/home',
      getPages: routes,
      theme: theme,
    );
  }
}