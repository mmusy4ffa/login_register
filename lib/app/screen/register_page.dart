
import 'package:flutter/material.dart';
import 'package:login_register/app/controllers/Database.dart';
import 'package:login_register/app/controllers/validation.dart';
import 'package:login_register/app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

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
        .showSnackBar(const SnackBar(content: Text('Register Berhasil')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange.shade400, Colors.orange.shade900])),
        child: Form(
          key: _formState, //Koneksi ke GlobalKey
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Daftar',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Silahkan Mengisi Form',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),

              const SizedBox(
                height: 50,
              ),

                Expanded(child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 200,),



                      //Nama Lengkap
              TextFormField(
                decoration: const InputDecoration(
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
                  return null;
                },
              ),

              //Inputan Email
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController, //Penghubung Controller
                decoration: const InputDecoration(
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
              const SizedBox(height: 20),
              TextFormField(
                controller:
                    passwordController, //Penghubung Password dengan Controller
                decoration: const InputDecoration(
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
              const SizedBox(height: 20),
              TextFormField(
                controller:
                    konfirmasiController, //Penghubung Password dengan Controllers
                decoration: const InputDecoration(
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
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.orange.shade200, Colors.orange.shade900]),
                    borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formState.currentState!.validate()) {
                      Register();
                      Navigator.pushNamed(context, '/');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Silahkan Lengkapi Form')));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text('Daftar'),
                ),
              ),

              //Kembali ke Page Login
              const SizedBox(height: 15,),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                
                child: const Center(
                  child: 
                 Text('Sudah punya akun? Login'),
              ),
              ),
            ],
          ),
        ),
      ),
                    ],
                  ),
                )),
                


              
    );
  }
}
