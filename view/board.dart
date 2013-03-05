part of educ_memory_game;

class Board {

  // board is drawn every interval in ms
  static const int interval = 10;
  // color of hidden cells
  static const String hiddenCellColorCode = '#f0f0f0';

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

    document.query('#canvas').onMouseDown.listen(onMouseDown);

    new Timer.repeating(const Duration(milliseconds: interval), (t) => draw());
  }

  void _clear() {
    context.clearRect(0, 0, size, size);
  }

  void _colorBox(Cell cell) {
    var x = cell.column * boxSize;
    var y = cell.row * boxSize;
    context.beginPath();
    if (cell.hidden) {
      context.fillStyle = hiddenCellColorCode;
      var centerX = cell.column * boxSize + boxSize/ 2;
      var centerY = cell.row * boxSize + boxSize/ 2;
      var radius = 4;
      context.arc(centerX, centerY, radius, 0, 2 * PI, false);
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
    int row = (e.offsetY ~/ boxSize).toInt();
    int column = (e.offsetX ~/ boxSize).toInt();
    Cell cell = memory.getCell(row, column);
    cell.hidden = false;
    if (cell.twin == lastCellClicked) {
      lastCellClicked.hidden = false;
      if (memory.recalled) {
        new Timer(const Duration(milliseconds: 2000), () => memory.hide());
      }
    } else if (cell.twin.hidden) {
      new Timer(const Duration(milliseconds: 800), () => cell.hidden = true);
    }
    lastCellClicked = cell;
  }

}
