import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 48, 20, 20),
        child: ListView(
          children: [
            Text(
              "Login Page",
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: _username,
              decoration: InputDecoration(
                  hintText: "username",
                  filled: true,
                  fillColor: isError
                      ? const Color.fromARGB(255, 131, 32, 25)
                      : Colors.white),
            ),
            TextField(
              obscureText: true,
              controller: _password,
              decoration: InputDecoration(
                  hintText: "password",
                  filled: true,
                  fillColor: isError
                      ? const Color.fromARGB(255, 131, 32, 25)
                      : Colors.white),
            ),
            SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  if (_username.text == "henri" && _password.text == "123") {
                    setState(() {
                      isError = false;
                    });
                    _username.text = "";
                    _password.text = "";
                  } else {
                    setState(() {
                      isError = true;
                    });
                  }
                  String message =
                      isError ? "Username / Password Salah" : "Login Berhasil";
                  SnackBar snackBar = SnackBar(content: Text(message));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
