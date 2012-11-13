
import 'dart:html';
import 'dart:isolate';

part 'model/memory.dart';
part 'view/board.dart';

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  new Board(canvas, new Memory(4));
}


