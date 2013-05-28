part of educ_memory_game;

class Board {

  // board is drawn every INTERVAL in ms
  static const int INTERVAL = 1200;
  // color of hidden cells
  static const String HIDDEN_CELL_COLOR_CODE = '#f0f0f0';

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num size, boxSize;
  Memory memory;
  Cell lastCellClicked;
  
  

  Board(this.canvas, this.memory) {
    context = canvas.getContext('2d');
    size = canvas.width;
    boxSize = size / memory.length;
    query('#canvas').onMouseDown.listen(onMouseDown);
    new Timer.periodic(const Duration(milliseconds: INTERVAL), (t) => draw());
  }
  
  void draw() {
    _clear();
    _boxes();
    if (memory.recalled) { // game over
      context.font = "bold 25px sans-serif";
      context.fillStyle = "red";
      context.fillText("YOU HAVE WON !", boxSize, boxSize * 2);
    }
  }

  void _clear() {
    context.clearRect(0, 0, size, size);
  }
  
  void _boxes() {
    for (Cell cell in memory.cells) _imageBox(cell);
  }
  
  void _imageBox(Cell cell) {
    var x = cell.column * boxSize;
    var y = cell.row * boxSize;
    context.beginPath();
    if (cell.hidden) {
      context.fillStyle = HIDDEN_CELL_COLOR_CODE;
      var centerX = cell.column * boxSize + boxSize / 2;
      var centerY = cell.row * boxSize + boxSize / 2;
      var radius = 4;
      context.arc(centerX, centerY, radius, 0, 2 * PI, false);
    } else {
      var imagePath = 'images/${cell.image}';
      ImageElement img = new Element.tag('img');
      img.src = imagePath;
      img.onLoad.listen((event) {
        //context.clearRect(x, y, boxSize, boxSize);
        context.drawImageToRect(img, new Rect(x, y, boxSize, boxSize));
       });
    }
    context.rect(x, y, boxSize, boxSize);
    context.fill();
    context.stroke();
    context.closePath();
  }

  void onMouseDown(MouseEvent e) {
    int row = (e.offset.y ~/ boxSize).toInt();
    int column = (e.offset.x ~/ boxSize).toInt();
    Cell cell = memory.getCell(row, column);
    cell.hidden = false;
    if (cell.twin == lastCellClicked) {
      lastCellClicked.hidden = false;
      // play sound when found the same 2 images:
      AudioElement thip = query('#thip');
      thip.play();
      if (memory.recalled) { // game over
        AudioElement fireballs = query('#fireballs');
        fireballs.play();
        new Timer(const Duration(milliseconds: 5000), () => memory.hide());
      }
    } else if (cell.twin.hidden) {
      new Timer(const Duration(milliseconds: 800), () => cell.hidden = true);
    }
    lastCellClicked = cell;
  }

}
