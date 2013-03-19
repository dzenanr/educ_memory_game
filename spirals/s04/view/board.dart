part of memory;

class Board {

  // The board is drawn every interval in ms.
  static const int interval = 8;
  //
  static const String colorCode = '#f0f0f0';

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num size;
  num boxSize;

  Memory memory;

  Board(this.canvas, this.memory) {
    context = canvas.getContext('2d');
    size = canvas.width;
    boxSize = size / memory.length;

    // Canvas event.
    document.query('#canvas').onMouseDown.listen(onMouseDown);

    // Draw every interval in ms.
    new Timer.periodic(const Duration(milliseconds: interval), (t) => draw());
  }

  void _clear() {
    context.clearRect(0, 0, size, size);
  }

  void _colorBox(Cell cell) {
    var x = cell.column * boxSize;
    var y = cell.row * boxSize;
    context.beginPath();
    if (cell.hidden) {
      context.fillStyle = colorCode;
    } else {
      context.fillStyle = colorMap[cell.color];
    }
    context.rect(x, y, boxSize, boxSize);
    context.fill();
    context.stroke();
    context.closePath();
  }

  void _boxes() {
    for (Cell cell in memory.cells) {
      _colorBox(cell);
    }
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
    cell.twin.hidden = false;
  }

}