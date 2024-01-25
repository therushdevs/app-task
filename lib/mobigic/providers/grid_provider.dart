import 'package:flutter/material.dart';

class GridProvider extends ChangeNotifier {
  List<List<String>> _charGrid = [];
  int _rows = 0;
  int _cols = 0;

  void setRowsAndColumns(String rows, String cols) {
    final r = int.parse(rows);
    final c = int.parse(cols);
    _rows = r;
    _cols = c;
    notifyListeners();
  }

  int getRows() {
    return _rows;
  }

  int getCols() {
    return _cols;
  }

  List<List<String>> getCharGrid() {
    return _charGrid;
  }

  void gridConversion(String characters) {
    List<List<String>> grid = [];
    int j = 0;
    for (int i = 1; i <= _rows; i++) {
      List<String> temp = [];
      while (j < (i * _cols)) {
        temp.add(characters[j]);
        j++;
      }
      grid.add(temp);
    }
    _charGrid = grid;
  }
}
