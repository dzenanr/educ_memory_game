
#import('dart:html');

#source('board.dart');

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  new Board(canvas);
}


