part of memory;

class Cell {

  int row;
  int column;
  Cell twin;
  String color;
  bool hidden = true;

  Memory memory;

  Cell(this.memory, this.row, this.column);

  bool intersects(int row, int column) {
    if (this.row == row && this.column == column) {
      return true;
    }
    return false;
  }

  bool get shown => !hidden;

}

class Cells {

  List list;

  Cells() {
    list = new List();
  }

  void add(Cell cell) {
    list.add(cell);
  }

  Iterator get iterator {
    return list.iterator;
  }

  bool every(Function f) {
    return list.every(f);
  }

}
