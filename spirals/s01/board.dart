part of memory;

class Board {

  // The board is drawn every INTERVAL in ms.
  static const int INTERVAL = 8;

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  Board(this.canvas) {
    context = canvas.getContext('2d');
    width = canvas.width;
    height = canvas.height;

    // Draw every INTERVAL in ms.
    new Timer.periodic(const Duration(milliseconds: INTERVAL), (t) => draw());
  }

  void clear() {
    context.clearRect(0, 0, width, height);
  }

  void border() {
    context.rect(0, 0, width, height);
    context.stroke();
  }

  void draw() {
    clear();
    border();
  }

}
