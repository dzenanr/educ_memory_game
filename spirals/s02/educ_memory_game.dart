library memory;

import 'dart:html';
import 'dart:async';

part 'model/memory.dart';
part 'view/board.dart';

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = querySelector('#canvas');
  new Board(canvas, new Memory(4));
}


