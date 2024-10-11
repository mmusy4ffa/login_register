import 'package:flutter/material.dart';
import 'package:login_register/app/controllers/login_controller.dart';
import 'package:login_register/app/controllers/validation.dart';
// import 'package:login_register/app/controllers/validation.dart'

class LoginPage extends StatelessWidget {
  final _formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formState, //Agar terhubung ke GlobalKey
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 100, color: Colors.blue),
              //Email Form
              SizedBox(height: 20),
              TextFormField(
                controller: emailController, // Penghubung Controller
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email Tidak Boleh Kosong!';
                  } else if (!isEmailValid(value)) {
                    return 'Email Tidak Valid!';
                  }
                  return null; //Jika berhasil
                },
              ),

              //Password Form
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password Tidak Boleh Kosong!';
                  } else if (value.length != 8) {
                    return 'Password Wajib 8 Karakter!';
                  }
                  return null;
                },
              ),

              // Login Button
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formState.currentState!.validate()) {
                    Navigator.pushNamed(context, '/HomePage');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Mohon Periksa Inputan Anda!')));
                  }
                },
                child: Text('Login'),
              ),

              //Register Form (Masuk Ke Page 2 untuk Daftar/Register)
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Register');
                  },
                  child: Text('Belum Punya Akun?'))
            ],
          ),
        ),
      ),
    );
  }
}
