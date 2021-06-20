import 'package:avalon/models/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class Player {
  late String name;
  late String mail;
  Character? character;
  bool isLeader = false;
  bool isQuestLeader = false;
  bool voteToken = false;
  bool teamToken = false;
  bool missionToken = false;

  Player(this.name, this.mail);

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
