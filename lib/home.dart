import 'package:flutter/material.dart';
import 'package:jubilee/events.dart';
import 'package:jubilee/hearttalk.dart';
import 'package:jubilee/prayer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF18D191))),
      body: HomePageContent(),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text(
                'DBRM',
                style: new TextStyle(fontSize: 40.0),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeartTalkPage(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Prayer(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Events(),
            )
          ],
        ),
      ),
    ]);
  }
}
