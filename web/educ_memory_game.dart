import 'dart:html';

import 'package:educ_memory_game/educ_memory_game.dart';

void main() {
  CanvasElement canvas = querySelector('#canvas');
  ButtonElement play = querySelector('#play');
  play.onClick.listen((Event e) {
    window.location.reload();
  });
  new Board(canvas, new Memory(4));
}




