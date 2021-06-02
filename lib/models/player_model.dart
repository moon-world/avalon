import 'package:avalon/models/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Player {
  late String name;
  late Character character;
  bool isLeader = false;
  bool voteToken = false;
  bool teamToken = false;
  bool missionToken = false;

  Player(this.name);

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
