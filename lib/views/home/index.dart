import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomoku_game/views/game/index.dart';
import 'package:gomoku_game/views/home/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomePageController());
    
    Widget radioItem<T>({ 
      required T value,
      required String label,
      required T groupValue,
      required void Function(T? value) onChanged,
    }) {
      return Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => onChanged(value),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Radio<T>(
                  value: value, 
                  groupValue: groupValue, 
                  onChanged: onChanged,
                ),
                Text(label)
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('五子棋'),
        brightness: Brightness.dark,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          width: 400,
          padding: EdgeInsets.only(top: 70),
          child: Obx(() => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  radioItem<GameMode>(
                    label: '单机模式',
                    value: GameMode.solo,
                    groupValue: c.mode.value,
                    onChanged: (val) => c.mode.value = val!
                  ),
                  radioItem<GameMode>(
                    label: '对战模式',
                    value: GameMode.vs,
                    groupValue: c.mode.value,
                    onChanged: (val) => c.mode.value = val!
                  )
                ]
              ),

              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 10),
                child: Text('等待时间'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  radioItem<Duration>(
                    label: '10秒',
                    value: const Duration(seconds: 10),
                    groupValue: c.waitTime.value,
                    onChanged: (val) => c.waitTime.value = val!
                  ),
                  radioItem<Duration>(
                    label: '20秒',
                    value: const Duration(seconds: 20),
                    groupValue: c.waitTime.value,
                    onChanged: (val) => c.waitTime.value = val!
                  ),
                  radioItem<Duration>(
                    label: '30秒',
                    value: const Duration(seconds: 30),
                    groupValue: c.waitTime.value,
                    onChanged: (val) => c.waitTime.value = val!
                  )
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 10),
                child: Text('电脑难度'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  radioItem<GameAILevel>(
                    label: '简单',
                    value: GameAILevel.esay,
                    groupValue: c.aiLevel.value,
                    onChanged: (val) => c.aiLevel.value = val!
                  ),
                  radioItem<GameAILevel>(
                    label: '通常',
                    value: GameAILevel.normal,
                    groupValue: c.aiLevel.value,
                    onChanged: (val) => c.aiLevel.value = val!
                  ),
                  radioItem<GameAILevel>(
                    label: '困难',
                    value: GameAILevel.hard,
                    groupValue: c.aiLevel.value,
                    onChanged: (val) => c.aiLevel.value = val!
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed('/game', arguments: GamePageArgs(config: c.getGameConfig())),
                    child: Text('开始游戏'),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}