
#import('dart:html');

#source('model/memory.dart');
#source('view/board.dart');

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  new Board(canvas, new Memory(4));
}


