import 'dart:developer';

final TAG = 'Memory Game';
void logger(String msg) {
  log("${TAG}|${DateTime.now().toIso8601String()} : ${msg}");
}