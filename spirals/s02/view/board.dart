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

  void _border() {
    context.rect(0, 0, width, height);
    context.stroke();
  }

  void _lines() {
    var gap = height / memory.length;
    var x, y;
    for (var i = 1; i < memory.length; i++) {
      x = gap * i;
      y = x;
      /*
      context.moveTo(x, 0);
      context.lineTo(x, height);
      context.moveTo(0, y);
      context.lineTo(width, y);
      */
      context
        ..moveTo(x, 0)
        ..lineTo(x, height)
        ..moveTo(0, y)
        ..lineTo(width, y);
    }
  }

  void draw() {
    _clear();
    _border();
    _lines();
  }
}
