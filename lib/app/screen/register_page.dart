import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon Gambar
            Icon(
              Icons.person,
              size: 100,
              color: Colors.blue,
            ),

            //Nama Lengkap
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),

            //Inputan Email
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            // Inputan Password
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              //Untuk Meng-hide Password tidak berbentuk String
              obscureText: true,
            ),

            //Konfirmasi Password
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Konfirmasi Password',
                border: OutlineInputBorder(),
              ),
              //Untuk Meng-hide Password tidak berbentuk String
              obscureText: true,
            ),

            //Tombol Lanjut Page
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Daftar'),
            ),

            //Kembali ke Page Login
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Sudah punya akun? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
