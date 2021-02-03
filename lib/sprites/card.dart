import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memory_game/c.dart';
import 'package:memory_game/memoryGame.dart';

class Card {
  final MemoryGame game;
  int index;
  Rect rectCard;
  Paint paintCard;

  bool isOpened;

  Card(this.game, this.index) {
    int indexX = index % 4;
    int indexY = (index / 4).toInt();
    isOpened = false;

    logger("Index : {$index} / X : {$indexX} / Y : {$indexY}");
    rectCard = new Rect.fromLTWH(
      game.frameSize + ( game.tileWidth * indexX ) + game.tileGap,
      game.frameSize + ( game.tileHeight * indexY ) + game.tileGap,
      game.tileWidth - (game.tileGap * 2),
      game.tileHeight - (game.tileGap * 2),
    );
    paintCard = Paint();
    paintCard.color = Color(0xffaaaaaa);
  }

  void render(Canvas c) {
    c.drawRect(rectCard, paintCard);
  }

  void update(double t) {}

  void onTabDown() {
    if (isOpened) {
      paintCard.color = Color(0xffaaaaaa);
      isOpened = false;
    } else {
      paintCard.color = Color(0xffff0000);
      isOpened = true;
    }
  }
}
