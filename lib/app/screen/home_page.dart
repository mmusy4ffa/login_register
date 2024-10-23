import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_register/app/models/user_model.dart';

class HomePage extends StatelessWidget {
  UserModel model;
  HomePage({super.key, required this.model});

  dynamic colorText = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue.shade700,
            Colors.indigo.shade700,
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang di Halaman Utama',
              style: TextStyle(color: colorText, fontSize: 20),
            ),
            Text(
              model.username,
              style: TextStyle(color: colorText, fontSize: 15),
            ),

            //Tombol Keluar
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context, '/HomePage');
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                }
              },
              child: Text(
                'Keluar',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
