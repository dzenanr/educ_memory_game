library memory;

import 'dart:html' ;
import 'dart:async';
import 'dart:math' ;

part 'model/cell.dart';
part 'model/memory.dart';
part 'view/board.dart';
part 'util/color.dart';
part 'util/random.dart';

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = querySelector('#canvas');
  new Board(canvas, new Memory(4));
}


