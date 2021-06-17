import 'package:avalon/models/player_model.dart';
import 'package:flutter/material.dart';

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
        Text("Players",
            style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'CinzelDecorative',
                fontWeight: FontWeight.w700)),
        Container(
          height: 150.0,
          child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 8.0,
              children: [
                for (var name in playersNames)
                  Center(
                      child: Text(name,
                          style:
                              TextStyle(fontSize: 20.0, fontFamily: 'Roboto'))),
              ]),
        ),
      ],
    );
  }
}
