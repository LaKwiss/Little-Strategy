import 'package:equatable/equatable.dart';

import '../domain_entities.dart';

class Cell extends Equatable {
  const Cell(
    this.units,
  );

  final List<Unit> units;

  @override
  List<Object?> get props => [units];

  Cell copyWith({
    List<Unit>? units,
  }) {
    return Cell(
      units ?? this.units,
    );
  }
}
