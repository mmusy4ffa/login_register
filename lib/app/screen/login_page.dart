import 'package:flutter/material.dart';
import 'package:login_register/app/controllers/login_controller.dart';
import 'package:login_register/app/controllers/Database.dart';
import 'package:login_register/app/controllers/validation.dart';
import 'package:login_register/app/screen/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:login_register/app/controllers/validation.dart'

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> Login() async {
    // final perfs = await SharedPreferences.getInstance();
    // String? savedUsername = perfs.getString('username');
    // String? savedPassword = perfs.getString('password');

    String email = emailController.text;
    String password = passwordController.text;
    print(database);
    for (var data in database) {
      if (data.email == email && data.password == password) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage(model: data)));
      }
    }

    // if (username == savedUsername && password == savedPassword) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text('Register Berhasil')));
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Username atau Password Salah')));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange.shade200, Colors.orange.shade700])),
          child: Form(
            key: _formState, //Agar terhubung ke GlobalKey
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Selamat Datang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Icon(Icons.person, size: 100, color: Colors.blue),
                // ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 100),

                        //Email
                        TextFormField(
                          controller: emailController, // Penghubung Controller
                          decoration: const InputDecoration(
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
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password Tidak Boleh Kosong!';
                            } else if (value.length < 8) {
                              return 'Password Wajib 8 Karakter!';
                            }
                            return null;
                          },
                        ),

                        // Login Button
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.orange.shade500,
                                Colors.pink.shade900
                              ]),
                              borderRadius: BorderRadius.circular(10)),
                          child: ElevatedButton(
                            onPressed: () {
                              print(_formState.currentState!.validate());
                              if (_formState.currentState!.validate()) {
                                Login();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Mohon Periksa Inputan Anda!')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                foregroundColor: Colors.white),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        //Register Form (Masuk Ke Page 2 untuk Daftar/Register)
                        const SizedBox(height: 20,),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/Register');
                            },
                            child: const Center(
                              child: Text('Belum Punya Akun?')),
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
