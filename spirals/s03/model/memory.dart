part of memory;

class Memory {
  int length;

  Cells cells;

  Memory(this.length) {
    cells = new Cells();
    var cell;
    for (var x = 0; x < length; x++) {
      for (var y = 0; y < length; y++) {
        cell = new Cell(this, x, y);
        cell.color = randomColor();
        cells.add(cell);
      }
    }
  }
}


