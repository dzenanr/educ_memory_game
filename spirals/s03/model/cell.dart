part of memory;

class Cell {
  int row, column;
  String color;
  Memory memory;

  Cell(this.memory, this.row, this.column);
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
}
