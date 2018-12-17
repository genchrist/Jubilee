import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jubilee/api.dart';

class LoginPage extends StatelessWidget {
  Future<bool> _loginUser() async {
    final api = await FBApi.signInWithGoogle();
    if (api != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.pink[900],
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF18D191))),
      body: Container(
        color: Colors.pink[900],
        child: Center(
          child: Container(
            height: 250.0,
            width: 250.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "25",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Years of",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Jesus Youth Tamil Nadu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                FlatButton(
                  color: Colors.orange[400],
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  onPressed: () async {
                    bool b = await _loginUser();

                    b
                        ? Navigator.of(context).pushNamed('home-page')
                        : Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Wrong Email!'),
                            ),
                          );
                  },
                  textColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
