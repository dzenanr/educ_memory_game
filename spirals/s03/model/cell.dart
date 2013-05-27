part of memory;

class Cell {

  int row, column;
  String color;

  Memory memory;

  Cell(this.memory, this.row, this.column);

}

class Cells {

  List list;

  Cells() {
    list = new List();
  }

  void add(Cell cell) {
    list.add(cell);
  }

  Iterator get iterator => list.iterator;

}
