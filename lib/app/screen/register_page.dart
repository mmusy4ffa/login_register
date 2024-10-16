import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_register/app/controllers/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterUser extends StatefulWidget {
  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  final _formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController konfirmasiController = TextEditingController();

//fungsi menyimpan data
  Future<void> RegisterUser() async {
    if (_formState.currentState!.validate()) {
      final perfs = await SharedPreferences.getInstance();
      await perfs.setString('nama', namaController.text);
      await perfs.setString('email', emailController.text);
      await perfs.setString('password', passwordController.text);

      //tampilan jika berhasil
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Register Berhasil')));

      //mengkosongkan jika sudah registrasi
      namaController.clear();
      emailController.clear();
      passwordController.clear();
      konfirmasiController.clear();
    }
  }

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
        child: Form(
          key: _formState, //Koneksi ke GlobalKey
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                controller: namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Wajib di Isi!';
                    // } else if (value.length != 5) {
                    //   return 'Karakter Wajib Lebih dari 4!';
                    // }
                  }
                },
              ),

              //Inputan Email
              SizedBox(height: 20),
              TextFormField(
                controller: emailController, //Penghubung Controller
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email Wajib Di-Isi';
                  } else if (!isEmailValid(value)) {
                    return 'Email Tidak Valid!';
                  }
                  return null;
                },
              ),

              // Inputan Password
              SizedBox(height: 20),
              TextFormField(
                controller:
                    passwordController, //Penghubung Password dengan Controller
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password Tidak Boleh Kosong!';
                  }
                  return null;
                },
                //Untuk Meng-hide Password tidak berbentuk String
                obscureText: true,
              ),

              //Konfirmasi Password
              SizedBox(height: 20),
              TextFormField(
                controller:
                    konfirmasiController, //Penghubung Password dengan Controllers
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password Harus Sama';
                  }
                  return null;
                },
                //Untuk Meng-hide Password tidak berbentuk String
                obscureText: true,
              ),

              //Tombol Lanjut Page
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formState.currentState!.validate()) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Silahkan Lengkapi Form')));
                  }
                },
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
      ),
    );
  }
}
