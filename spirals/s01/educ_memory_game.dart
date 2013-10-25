library memory;

import 'dart:html';
import 'dart:async';

part 'board.dart';

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.querySelector('#canvas');
  new Board(canvas);
}


