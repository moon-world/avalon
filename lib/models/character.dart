import 'package:avalon/models/loyalties.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class Character {
  late String name;
  late Loyalty loyalty;
  late String description;
  late String imagePath;
  @JsonKey(ignore: true)
  late Image image;
  @JsonKey(ignore: true)
  String? showedImagePath;

  Character(this.name, this.loyalty, this.description, this.imagePath) {
    image = new Image(image: AssetImage(imagePath));
  }

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
