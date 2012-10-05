
#import('dart:html');
#import('dart:math');

#source('model/cell.dart');
#source('model/memory.dart');
#source('view/board.dart');
#source('util/color.dart');
#source('util/random.dart');

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  new Board(canvas, new Memory(4));
}


