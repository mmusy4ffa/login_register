import 'package:flutter/material.dart';
import 'package:login_register/app/controllers/validation.dart';

class RegisterPage extends StatelessWidget {
  final _formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Wajib di Isi!';
                  } else if (value.length != 5) {
                    return 'Karakter Wajib Lebih dari 4!';
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
                  } else if (value.length != 8) {
                    return 'Password Wajib 8 Karakter!';
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
                    passwordController, //Penghubung Password dengan Controllers
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
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

              //Tombol Lanjut Page
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formState.currentState!.validate()) {
                    Navigator.pushNamed(context, '/HomePage');
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
