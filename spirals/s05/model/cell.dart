part of memory;

class Cell {
  int row, column;
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
  List _list;

  Cells() {
    _list = new List();
  }

  void add(Cell cell) {
    _list.add(cell);
  }

  Iterator get iterator => _list.iterator;
  
  bool every(Function f) => _list.every(f);
}
