library educ_memory_game;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'model/cell.dart';
part 'model/memory.dart';
part 'view/board.dart';
part 'util/images.dart';
part 'util/random.dart';

void main() {
  CanvasElement canvas = querySelector('#canvas');
  ButtonElement play = querySelector('#play');
  play.onClick.listen((Event e) {
    window.location.reload();
  });
  new Board(canvas, new Memory(4));
}




