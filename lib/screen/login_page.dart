import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/movie_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  bool isLoggedIn = false;

  void _login() {
    if (userC.text == "Andhika" && passC.text == "041") {
      setState(() {
        isLoggedIn = true;
      });
      // kita pindah ke halaman home_page (MODUL 4)
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => MovieListPage(username: userC.text))
      );

    } else {
      setState(() {
        isLoggedIn = false;
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isLoggedIn ? 'Login Berhasil' : 'Login Gagal'),
        backgroundColor: isLoggedIn ? Colors.green : Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 5),

            Text(
              "Welcome back to MiniLens!",
              style: TextStyle(
                color: Colors.grey
              ),
            ),

            SizedBox(height: 30,),
            _usernameField(),
            SizedBox(height: 15,),
            _passwordField(),
            SizedBox(height: 20,),
        
            ElevatedButton(
              onPressed: _login,                          
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 45)
              ),
               child: Text("login")
               ),
          ],
        ),
      ),
    );
  }

  Widget _usernameField(){
    return TextField(
        // nambahin controller
        controller: userC,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'username....',
      )
    );
  }

  Widget _passwordField(){
    return TextField(
        // nambahin controller
        controller: passC,
        // hide karakter (password)
        obscureText: true,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'password....',
      )
    );
  }
}