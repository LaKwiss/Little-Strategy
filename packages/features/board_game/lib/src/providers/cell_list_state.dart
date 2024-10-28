part of 'cell_list_provider.dart';

class CellListState extends Equatable {
  const CellListState({
    required this.cells,
  });

  factory CellListState.initial() {
    // CellListState is a list of cells, which are a list of units
    // Add Cell's here to initialize the board
    return const CellListState(
      cells: [],
    );
  }

  final List<Cell> cells;

  CellListState copyWith({
    List<Cell>? cells,
  }) {
    return CellListState(
      cells: cells ?? this.cells,
    );
  }

  @override
  List<Object?> get props => [cells];

  @override
  bool get stringify => true;
}
