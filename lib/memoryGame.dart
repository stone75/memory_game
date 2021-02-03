import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flutter/gestures.dart';
import 'package:memory_game/c.dart';
import 'package:memory_game/sprites/bg.dart';
import 'package:memory_game/sprites/card.dart';
import 'package:memory_game/sprites/frame.dart';

class MemoryGame extends BaseGame {
  Size screenSize;
  double frameSize;
  double tileWidth;
  double tileHeight;
  double tileGap;

  Background bg;
  Frame frame;
  List<Card> cards;

  MemoryGame() {
    init();
  }

  void init() async {
    resize(await Flame.util.initialDimensions());

    bg = Background(this);
    frame = Frame(this);
    cards = List<Card>();
    for (int i = 0; i < 16; i++) {
      cards.add(Card(this, i));
    }
  }

  void render(Canvas canvas) {
    bg.render(canvas);
    frame.render(canvas);
    // card.render(canvas);
    cards.forEach((element) => element.render(canvas));
  }

  void update(double t) {}

  void onTapDown(TapDownDetails d) {
    // music button
    // if (!isHandled && musicButton.rect.contains(d.globalPosition)) {
    //   musicButton.onTapDown();
    //   // isHandled = true;
    //   return;
    // }
    cards.forEach((element) {
      if (element.rectCard.contains(d.globalPosition)) {
        element.onTabDown();
      }
    });

  }


  void resize(Size size) {
    screenSize = size;
    tileWidth = screenSize.width / 5;
    tileHeight = screenSize.height / 6;
    frameSize = tileWidth / 2;
    tileGap = tileWidth / 10;

    super.resize(size);
  }
}
