import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final String name;
  final int bloodVolume;
  final double speed;
  final bool canFly;
  final Bag bag;
  final List<Weapon> weapons;
  final List<String> accessories;

  Person(
      {required this.name,
      required this.bloodVolume,
      required this.speed,
      required this.canFly,
      required this.bag,
      required this.weapons,
      required this.accessories});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable()
class Bag {
  final String name;
  final int capacity;

  Bag({required this.name, required this.capacity});

  factory Bag.fromJson(Map<String, dynamic> json) => _$BagFromJson(json);

  Map<String, dynamic> toJson() => _$BagToJson(this);
}

@JsonSerializable()
class Weapon {
  final String name;
  final int damage;

  Weapon({required this.name, required this.damage});

  factory Weapon.fromJson(Map<String, dynamic> json) => _$WeaponFromJson(json);

  Map<String, dynamic> toJson() => _$WeaponToJson(this);
}
