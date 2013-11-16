part of memory;

class Board {
  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  Memory memory;

  Board(this.canvas, this.memory) {
    context = canvas.getContext('2d');
    width = canvas.width;
    height = canvas.height;
    window.animationFrame.then(gameLoop);
  }

  void gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }

  void _clear() {
    context.clearRect(0, 0, width, height);
  }

  void _colorBox(Cell cell) {
    var gap = height / memory.length;
    var x = cell.row * gap;
    var y = cell.column * gap;
    context
      ..beginPath()
      ..fillStyle = colorMap[cell.color]
      ..rect(x, y, gap, gap)
      ..fill()
      ..stroke()
      ..closePath();
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
