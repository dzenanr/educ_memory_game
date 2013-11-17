part of memory;

class Board {
  static const String COLOR_CODE = '#f0f0f0';

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num size;
  num boxSize;

  Memory memory;

  Cell lastCellClicked;

  Board(this.canvas, this.memory) {
    context = canvas.getContext('2d');
    size = canvas.width;
    boxSize = size / memory.length;
    // Canvas event.
    querySelector('#canvas').onMouseDown.listen(onMouseDown);
    window.animationFrame.then(gameLoop);
  }

  void gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }

  void _clear() {
    context.clearRect(0, 0, size, size);
  }

  void _colorBox(Cell cell) {
    var x = cell.column * boxSize;
    var y = cell.row * boxSize;
    context.beginPath();
    if (cell.hidden) {
      context.fillStyle = COLOR_CODE;
    } else {
      context.fillStyle = colorMap[cell.color];
    }
    context
      ..rect(x, y, boxSize, boxSize)
      ..fill()
      ..stroke()
      ..closePath();
  }

  void _boxes() {
    for (Cell cell in memory.cells) _colorBox(cell);
  }

  void draw() {
    _clear();
    _boxes();
  }

  void onMouseDown(MouseEvent e) {
    int row = (e.offset.y ~/ boxSize).toInt();
    int column = (e.offset.x ~/ boxSize).toInt();
    Cell cell = memory.getCell(row, column);
    cell.hidden = false;
    if (cell.twin == lastCellClicked && lastCellClicked.shown) {
      lastCellClicked.hidden = false;
      if (memory.recalled) memory.hide();
    } else {
      new Timer(const Duration(milliseconds: 1000), () => cell.hidden = true);
    }
    lastCellClicked = cell;
  }
}
