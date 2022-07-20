// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      name: json['name'] as String,
      bloodVolume: json['bloodVolume'] as int,
      speed: (json['speed'] as num).toDouble(),
      canFly: json['canFly'] as bool,
      bag: Bag.fromJson(json['bag'] as Map<String, dynamic>),
      weapons: (json['weapons'] as List<dynamic>)
          .map((e) => Weapon.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessories: (json['accessories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'bloodVolume': instance.bloodVolume,
      'speed': instance.speed,
      'canFly': instance.canFly,
      'bag': instance.bag,
      'weapons': instance.weapons,
      'accessories': instance.accessories,
    };

Bag _$BagFromJson(Map<String, dynamic> json) => Bag(
      name: json['name'] as String,
      capacity: json['capacity'] as int,
    );

Map<String, dynamic> _$BagToJson(Bag instance) => <String, dynamic>{
      'name': instance.name,
      'capacity': instance.capacity,
    };

Weapon _$WeaponFromJson(Map<String, dynamic> json) => Weapon(
      name: json['name'] as String,
      damage: json['damage'] as int,
    );

Map<String, dynamic> _$WeaponToJson(Weapon instance) => <String, dynamic>{
      'name': instance.name,
      'damage': instance.damage,
    };
