import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  dynamic colorText = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang di Halaman Utama',
              style: TextStyle(color: colorText, fontSize: 20),
            ),
            Text(
              'Halo Musyaffa!',
              style: TextStyle(color: colorText, fontSize: 15),
            ),

            //Tombol Keluar
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '/HomePage');
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
