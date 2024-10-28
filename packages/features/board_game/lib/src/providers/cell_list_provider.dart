import 'package:domain_entities/domain_entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'cell_list_state.dart';

class CellListProvider with ChangeNotifier {
  CellListState _state = CellListState.initial();
  CellListState get state => _state;

  void addCell(Cell cell) {
    _state = _state.copyWith(cells: [..._state.cells, cell]);
    notifyListeners();
  }

  void removeCell(Cell cell) {
    _state = _state.copyWith(cells: _state.cells..remove(cell));
    notifyListeners();
  }

  void updateCell(Cell oldCell, Cell newCell) {
    final index = _state.cells.indexOf(oldCell);
    _state.cells[index] = newCell;
    notifyListeners();
  }

  void clearCells() {
    _state = _state.copyWith(cells: []);
    notifyListeners();
  }

  void fillCellWithUnit(Cell cell, Unit unit) {
    final index = _state.cells.indexOf(cell);
    final newCell = cell.copyWith(units: [...cell.units, unit]);
    _state.cells[index] = newCell;
    notifyListeners();
  }
}
