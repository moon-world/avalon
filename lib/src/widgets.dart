import 'package:avalon/localization/Localizations.dart';
import 'package:avalon/models/character.dart';
import 'package:avalon/models/player_model.dart';
import 'package:avalon/services/rt_database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: TextStyle(fontSize: 24),
        ),
      );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: TextStyle(fontSize: 18),
        ),
      );
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail);
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 8),
            Text(
              detail,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.deepPurple)),
        onPressed: onPressed,
        child: child,
      );
}

class PlayersTable extends StatelessWidget {
  const PlayersTable({required this.players});
  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    var playersNames = [];
    for (var player in players) {
      playersNames.add(player.name);
    }
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Text(AvalonLocalizations.of(context).players,
              style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'CinzelDecorative',
                  fontWeight: FontWeight.w700)),
        ),
        Expanded(
          flex: 8,
          child: Container(
            height: 120.0,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 8.0,
              children: [
                for (var name in playersNames)
                  Center(
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Roboto'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

int currentIndex = 0;

class CharactersCarousel extends StatelessWidget {
  final List<Character> charactersList;
  CharactersCarousel(
      {required this.charactersList,
      required this.database,
      required this.isLeader});
  final bool isLeader;
  final RealTimeDataBase database;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: CarouselSlider(
            options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: changeChosenCharacter),
            items: charactersList.map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                      child: e.image, borderRadius: BorderRadius.circular(20));
                },
              );
            }).toList(),
          ),
        ),
        if (isLeader)
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: const Icon(Icons.add_circle_outline_sharp),
                    iconSize: 30,
                    color: Colors.blueAccent.shade100,
                    onPressed: () {
                      addCharacter();
                    }),
                IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    iconSize: 30,
                    color: Colors.red.shade300,
                    onPressed: () {
                      removeCharacter();
                    }),
              ],
            ),
          )
      ],
    );
  }

  changeChosenCharacter(int index, CarouselPageChangedReason reason) {
    currentIndex = index;
  }

  void addCharacter() {
    database.addCharacter(charactersList[currentIndex]);
  }

  void removeCharacter() {
    var character = charactersList[currentIndex];
    database.removeCharacter(character);
  }
}

class ChosenCharactersTable extends StatelessWidget {
  ChosenCharactersTable({required this.database});
  final RealTimeDataBase database;
  late bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    if (database.gameSession!.characters != null) {
      isEmpty = false;
    } else {
      isEmpty = true;
    }

    if (isEmpty) {
      return Container(
        height: 120.0,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: 120.0,
          child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 8.0,
              children: [
                for (var character in database.gameSession!.characters!)
                  Center(
                      child: Text(character.name,
                          style:
                              TextStyle(fontSize: 16.0, fontFamily: 'Roboto'))),
              ]),
        ),
      );
    }
  }
}
