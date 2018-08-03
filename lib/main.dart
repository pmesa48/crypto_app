import 'package:flutter/material.dart';
import 'package:crypto_currencies/pages/home/home_page.dart';
import 'package:crypto_currencies/pages/login/login_page.dart';


void main() => runApp(new MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/': (BuildContext context) => new LoginPage()
};

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Crypto',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: routes,
    );
  }
}
