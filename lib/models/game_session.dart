import 'package:avalon/models/character.dart';
import 'package:avalon/models/player_model.dart';
import 'package:avalon/models/quest.dart';

class GameSession {
  late String sessionId;
  late int numberOfPlayers;
  late int numberOfMinions;
  late Map<Player, Character> players;
  late List<Character> characters;
  late List<Quest> quests;
}
