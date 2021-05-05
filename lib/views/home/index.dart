import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gomoku_game/views/home/components/button_radio.dart';
import 'package:gomoku_game/views/home/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomePageController());
    
    return Scaffold(
      appBar: AppBar(
        title: Text('五子棋'),
        brightness: Brightness.dark,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          width: MediaQueryData.fromWindow(window).size.width * 0.7,
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Obx(() => (
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonRadio(
                      text: '单人模式', 
                      selected: c.mode.value == GameMode.solo, 
                      onPressed: c.toggleMode
                    ),
                    ButtonRadio(
                      text: '对战模式', 
                      selected: c.mode.value == GameMode.vs, 
                      onPressed: c.toggleMode
                    )
                  ],
                )
              ))
            ],
          ),
        ),
      ),
    );
  }
}