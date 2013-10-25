library educ_memory_game;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'model/cell.dart';
part 'model/memory.dart';
part 'view/board.dart';
part 'util/color.dart';
part 'util/random.dart';

CanvasElement canvas;

void main() {
  canvas = querySelector('#canvas');
  ButtonElement play = querySelector('#play');
  play.onClick.listen(playAgain);
  new Board(canvas, new Memory(4));
}

playAgain(Event e) {
  window.location.reload();
}


