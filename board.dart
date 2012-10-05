
class Board {

  // The board is drawn every interval in ms.
  static const int interval = 8;

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  Board(this.canvas) {
    context = canvas.getContext('2d');
    width = canvas.width;
    height = canvas.height;

    // Draw every interval in ms.
    document.window.setInterval(draw, interval);
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