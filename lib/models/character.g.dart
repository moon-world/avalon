// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map json) {
  return Character(
    json['name'] as String,
    _$enumDecode(_$LoyaltyEnumMap, json['loyalty']),
    json['description'] as String,
    json['imagePath'] as String,
  );
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'loyalty': _$LoyaltyEnumMap[instance.loyalty],
      'description': instance.description,
      'imagePath': instance.imagePath,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$LoyaltyEnumMap = {
  Loyalty.none: 'none',
  Loyalty.arthur: 'arthur',
  Loyalty.mordred: 'mordred',
};
