import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_register/app/controllers/Database.dart';
import 'package:login_register/app/controllers/validation.dart';
import 'package:login_register/app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterUser extends StatefulWidget {
  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  final _formState = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController konfirmasiController = TextEditingController();

//fungsi menyimpan data
  Future<void> Register() async {
    // final perfs = await SharedPreferences.getInstance();
    String username = namaController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String konfirmasi = konfirmasiController.text;

    database
        .add(UserModel(username: username, email: email, password: password));
    for (var data in database) {
      print(data.email);
      print(data.password);
      print(data.username);
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Register Berhasil')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue.shade500, Colors.indigo.shade900])),
        child: Form(
          key: _formState, //Koneksi ke GlobalKey
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Daftar',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Silahkan Mengisi Form',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),

              SizedBox(
                height: 20,
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
              Container(
                width: 450,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade500, Colors.indigo.shade900]),
                    borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formState.currentState!.validate()) {
                      Register();
                      Navigator.pushNamed(context, '/');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Silahkan Lengkapi Form')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text('Daftar'),
                ),
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
