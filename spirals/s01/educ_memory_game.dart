library memory;

import 'dart:html';

part 'board.dart';

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = querySelector('#canvas');
  new Board(canvas);
}


