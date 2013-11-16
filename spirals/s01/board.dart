part of memory;

class Board {
  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  Board(this.canvas) {
    context = canvas.getContext('2d');
    width = canvas.width;
    height = canvas.height;
    window.animationFrame.then(gameLoop);
  }

  void gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }

  void clear() {
    context.clearRect(0, 0, width, height);
  }

  void border() {
    /*
    context.rect(0, 0, width, height);
    context.stroke();
    */
    context..rect(0, 0, width, height)..stroke();
  }
  
  void draw() {
    clear();
    border();
  }
}
