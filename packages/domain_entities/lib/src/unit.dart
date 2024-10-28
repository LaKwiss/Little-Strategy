import 'package:equatable/equatable.dart';

class Unit extends Equatable {
  const Unit({
    required this.name,
    required this.attack,
    required this.defense,
  });

  final String name;
  final int attack;
  final int defense;

  @override
  List<Object?> get props => [
        name,
        attack,
        defense,
      ];
}
