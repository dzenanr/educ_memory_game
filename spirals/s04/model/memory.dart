part of memory;

class Memory {
  int length;
  bool recalled = false;

  Cells cells;
  List usedColors = [];

  Memory(this.length) {
    if (length.isOdd) {
      throw new Exception(
          'Memory length must be an even integer: ${length}.');
    }
    cells = new Cells();
    var cell, twinCell;
    for (var x = 0; x < length; x++) {
      for (var y = 0; y < length; y++) {
        cell = getCell(y, x);
        if (cell == null) {
          cell = new Cell(this, y, x);
          cell.color = _getFreeRandomColor();
          cells.add(cell);
          twinCell = _getFreeRandomCell();
          cell.twin = twinCell;
          twinCell.twin = cell;
          twinCell.color = cell.color;
          cells.add(twinCell);
        }
      }
    }
  }

  Cell getCell(int row, int column) {
    for (Cell cell in cells) {
      if (cell.intersects(row, column)) {
        return cell;
      }
    }
  }

  Cell _getFreeRandomCell() {
    var row;
    var column;
    Cell cell;
    do {
      row = randomInt(length);
      column = randomInt(length);
      cell = getCell(row, column);
    } while (cell != null);
    return new Cell(this, row, column);
  }

  String _getFreeRandomColor() {
    var color;
    do {
      color = randomColor();
    } while (usedColors.any((c) => c == color));
    usedColors.add(color);
    return color;
  }
}


