import 'package:flutter/material.dart';
import 'package:login_register/login_page.dart';
import 'package:login_register/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //mematikan mode debug
      title: 'Login/Register Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/Register': (context) => RegisterPage(),
      },
    );
  }
}
