part of memory;

class Board {

  // The board is drawn every interval in ms.
  static const int interval = 8;

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  Memory memory;

  Board(this.canvas, this.memory) {
    context = canvas.getContext('2d');
    width = canvas.width;
    height = canvas.height;

    // Draw every interval in ms.
    new Timer.periodic(const Duration(milliseconds: interval), (t) => draw());
  }

  void _clear() {
    context.clearRect(0, 0, width, height);
  }

  void _colorBox(Cell cell) {
    var gap = height / memory.length;
    var x = cell.row * gap;
    var y = cell.column * gap;
    context.beginPath();
    context.fillStyle = colorMap[cell.color];
    context.rect(x, y, gap, gap);
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

}
