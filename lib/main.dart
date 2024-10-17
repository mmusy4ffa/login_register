import 'package:flutter/material.dart';
import 'package:login_register/app/screen/home_page.dart';
import 'package:login_register/app/screen/login_page.dart';
import 'package:login_register/app/screen/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> checkLoginStatus() async {
    final perfs = await SharedPreferences.getInstance();
    return perfs.getBool('isLogged') ?? false;
  }

  @override
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
        '/Register': (context) => RegisterUser(),
      },
    );
  }
}
