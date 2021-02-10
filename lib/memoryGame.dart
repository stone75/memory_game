import 'dart:math';
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
  List<int> selectedIndex;
  List<int> selectedValue;
  int selectSize;

  MemoryGame() {
    init();
  }

  void init() async {
    resize(await Flame.util.initialDimensions());

    bg = Background(this);
    frame = Frame(this);
    cards = List<Card>();
    List<int> values = List<int>();
    selectedIndex = List<int>();
    selectedValue = List<int>();
    selectSize = 2;

    for (int i=0; i<8; i++) {
      values.add(i);
      values.add(i);
    }
    values.shuffle(Random.secure());

    for (int i = 0; i < 16; i++) {
      cards.add(Card(this, i, values[i]));
    }
  }

  void render(Canvas canvas) {
    bg.render(canvas);
    frame.render(canvas);
    cards.forEach((element) => element.render(canvas));
  }

  void update(double t) {
    cards.forEach((element) => element.update(t));
  }

  void onTapDown(TapDownDetails d) {
    cards.forEach((element) {
      if (element.rectCard.contains(d.globalPosition)) {
        if (element.isCleared) {
          return;
        }

        element.onTabDown();

        selectedIndex.add(element.index);
        selectedValue.add(element.value);

        if (selectedValue.length == selectSize) {
          if (checkSelected()) {
            for (int i=0; i<selectedIndex.length; i++) {
              cards[selectedIndex[i]].setClear();
            }
          } else {
            for (int i=0; i<selectedIndex.length; i++) {
              cards[selectedIndex[i]].onTabDown();
            }
          }

          selectedIndex.clear();
          selectedValue.clear();
        }
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

  bool checkSelected() {
    int targetValue = -1;

    for (int i=0; i<selectSize; i++) {
      if (targetValue == -1) {
        targetValue = cards[selectedIndex[i]].value;
        continue;
      }

      if (cards[selectedIndex[i]].value != targetValue) {
        return false;
      }
    }

    return true;
  }
}
