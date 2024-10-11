import 'package:flutter/material.dart';
import 'package:login_register/app/screen/home_page.dart';
import 'package:login_register/app/screen/login_page.dart';
import 'package:login_register/app/screen/register_page.dart';
import 'package:login_register/contoh.dart';

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
        '/HomePage': (context) => HomePage(),
      },
    );
  }
}
