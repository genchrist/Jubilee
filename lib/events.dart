import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('events').getDocuments();

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
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
                      child: Stack(
                        fit: StackFit.loose,
                        children: <Widget>[
                          new ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: new Hero(
                                tag: 'event',
                                child: new CachedNetworkImage(
                                  imageUrl: snapshot.data[index].data['image'],
                                  errorWidget: new Icon(Icons.error),
                                  fadeOutDuration: new Duration(seconds: 0),
                                  fadeInDuration: new Duration(seconds: 0),
                                  width: 200.0,
                                  height: 150.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0),
                            child: Container(
                              height: 70.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text(
                                    snapshot.data[index].data['name'],
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}

class EventsDetail extends StatefulWidget {
  @override
  _EventsDetailState createState() => _EventsDetailState();
}

class _EventsDetailState extends State<EventsDetail> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
