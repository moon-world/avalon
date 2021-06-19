import 'package:avalon/services/rt_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameplayPage extends StatefulWidget {
  @override
  _GameplayPage createState() => _GameplayPage();
}

class _GameplayPage extends State<GameplayPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Material(
          child:
              Consumer<RealTimeDataBase>(builder: (context, database, child) {
            return Column(
              children: [
                Expanded(flex: 4, child: ArthursTable(database: database)),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class ArthursTable extends StatelessWidget {
  final RealTimeDataBase database;
  ArthursTable({required this.database});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.98,
        height: MediaQuery.of(context).size.width * 0.98,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade700, shape: BoxShape.circle),
        child: Stack(
          children: <Widget>[
            //center circle
            Positioned(
              width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
              top: 5.0,
              left: MediaQuery.of(context).size.width * 0.98 / 2 -
                  ((MediaQuery.of(context).size.width * 0.98 - 10) / 4) / 2,
              child: Container(
                width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                height: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/Merlin.png'),
                  ),
                ),
              ),
            ),
            //left top circle
            Positioned(
              width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
              top: (MediaQuery.of(context).size.width * 0.98 - 10) / 5,
              left: ((MediaQuery.of(context).size.width * 0.98 - 10) / 5) -
                  ((MediaQuery.of(context).size.width * 0.98 - 10) / 5) / 2,
              child: Container(
                width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                height: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/Merlin.png'),
                  ),
                ),
              ),
            ),
            //right tip circle
            Positioned(
              width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
              top: (MediaQuery.of(context).size.width * 0.98 - 10) / 5,
              right: ((MediaQuery.of(context).size.width * 0.98 - 10) / 5) / 2,
              child: Container(
                width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                height: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/Merlin.png'),
                  ),
                ),
              ),
            ),
            //left bottom circle
            Positioned(
              width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
              top: ((MediaQuery.of(context).size.width * 0.98 - 10) / 5) * 3,
              left: ((MediaQuery.of(context).size.width * 0.98 - 10) / 5) -
                  ((MediaQuery.of(context).size.width * 0.98 - 10) / 5) / 2,
              child: Container(
                width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                height: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/Merlin.png'),
                  ),
                ),
              ),
            ),
            //right bottom circle
            Positioned(
              width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
              top: ((MediaQuery.of(context).size.width * 0.98 - 10) / 5) * 3,
              right: ((MediaQuery.of(context).size.width * 0.98 - 10) / 5) / 2,
              child: Container(
                width: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                height: (MediaQuery.of(context).size.width * 0.98 - 10) / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/Merlin.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
