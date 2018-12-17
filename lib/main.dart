import 'package:flutter/material.dart';
import 'package:jubilee/home.dart';
import 'package:jubilee/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jubilee',
      theme: ThemeData.light(),
      routes: {
        'login-page': (context) => LoginPage(),
        'home-page': (context) => HomePage()
      },
      home: LoginPage(),
    );
  }
}
