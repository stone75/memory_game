import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memory_game/c.dart';
import 'package:memory_game/memoryGame.dart';

class Card {
  final MemoryGame game;
  int index;
  int value;
  Rect rectCard;
  Paint paintCard;
  TextPainter painterValue;
  TextStyle styleValue;
  Offset position;

  bool isOpened;
  bool isCleared;

  Card(this.game, this.index, this.value) {
    int indexX = index % 4;
    int indexY = (index / 4).toInt();
    isOpened = false;
    isCleared = false;

    logger("Index : {$index} / X : {$indexX} / Y : {$indexY}");
    rectCard = new Rect.fromLTWH(
      game.frameSize + ( game.tileWidth * indexX ) + game.tileGap,
      game.frameSize + ( game.tileHeight * indexY ) + game.tileGap,
      game.tileWidth - (game.tileGap * 2),
      game.tileHeight - (game.tileGap * 2),
    );
    paintCard = Paint();
    paintCard.color = Color(0xffaaaaaa);

    styleValue = TextStyle(
      color: Color(0xffffffff),
      fontSize: 30,
    );

    painterValue = TextPainter(
      text: TextSpan (
        text: value.toString(),
        style: styleValue,
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    painterValue.layout();

    position = Offset(
      rectCard.left + (rectCard.width - painterValue.width) / 2,
      rectCard.top + (rectCard.height - painterValue.height) / 2
    );
  }

  void render(Canvas c) {
    c.drawRect(rectCard, paintCard);
    painterValue.paint(c, position);
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

  void setClear() {
    paintCard.color = Color(0xff00ff00);
  }
}
