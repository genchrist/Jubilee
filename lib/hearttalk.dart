import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HeartTalkPage extends StatefulWidget {
  @override
  _HeartTalkPageState createState() => _HeartTalkPageState();
}

class _HeartTalkPageState extends State<HeartTalkPage> {
  Future _data;
  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('Heart Talk').getDocuments();

    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
    _data = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: FutureBuilder(
          future: _data,
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
                                tag: 'hearttalk',
                                child: new CachedNetworkImage(
                                  imageUrl: snapshot.data[index].data['image'],
                                  errorWidget: new Icon(Icons.error),
                                  fadeOutDuration: new Duration(seconds: 1),
                                  fadeInDuration: new Duration(seconds: 1),
                                  width: 200.0,
                                  height: 250.0,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 110.0, right: 18.0, left: 8.0),
                            child: Container(
                              height: 80.0,
                              width: 250.0,
                              child: new Text(
                                snapshot.data[index].data['title'],
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 200.0, left: 8.0),
                            child: new ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: new CachedNetworkImage(
                                imageUrl: snapshot.data[index].data['photo'],
                                errorWidget: new Icon(Icons.error),
                                fadeOutDuration: new Duration(seconds: 1),
                                fadeInDuration: new Duration(seconds: 1),
                                width: 30.0,
                                height: 30.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 205.0, right: 8.0, left: 50.0),
                            child: Container(
                              height: 80.0,
                              width: 250.0,
                              child: new Text(
                                snapshot.data[index].data['name'],
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
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

class HeartTalkDetailPage extends StatefulWidget {
  final DocumentSnapshot post;

  HeartTalkDetailPage({this.post});

  @override
  _HeartTalkDetailPageState createState() => _HeartTalkDetailPageState();
}

class _HeartTalkDetailPageState extends State<HeartTalkDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF18D191))),
      body: Container(),
    );
  }
}
