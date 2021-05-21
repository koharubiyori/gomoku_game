import 'package:get/get.dart';
import 'package:gomoku_game/views/game/index.dart';
import 'package:gomoku_game/views/home/index.dart';

final List<GetPage> routes = [
  GetPage(
    name: '/home', 
    page: () => HomePage()
  ),
  GetPage(
    name: '/game',
    page: () => GamePage()
  )
];