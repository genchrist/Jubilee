import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Prayer extends StatefulWidget {
  @override
  _PrayerState createState() => _PrayerState();
}

class _PrayerState extends State<Prayer> {
  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('prayer').getDocuments();

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text('Loading'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 300.0,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.pink[900],
                        ),
                        child: Stack(
                          fit: StackFit.loose,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, right: 8.0, left: 8.0),
                              child: Container(
                                height: 80.0,
                                width: 100.0,
                                child: Center(
                                  child: new Text(
                                    'Pray for Jubilee',
                                    style: new TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  right: 8.0,
                                  left: 108.0,
                                  bottom: 8.0),
                              child: Container(
                                height: 100.0,
                                width: 250.0,
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: new Text(
                                    snapshot.data[index].data['count']
                                        .toString(),
                                    style: new TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

class PrayerDetail extends StatefulWidget {
  @override
  _PrayerDetailState createState() => _PrayerDetailState();
}

class _PrayerDetailState extends State<PrayerDetail> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
