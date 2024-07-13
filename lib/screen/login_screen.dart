import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lamphun_application/config/app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  Future<void> login() async {
    final resonse = await http.post(
        Uri.parse(
          '${API_URL}/api/auth/login',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': _email.text,
          'password': _password.text,
        }));
    print(resonse.body);

    if (resonse.statusCode == 200) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Column(
        children: [
          Text('โปรดเข้าสู่ระบบ'),
          TextFormField(
            controller: _email,
            decoration: InputDecoration(
              labelText: 'อีเมล',
            ),
          ),
          TextFormField(
            controller: _password,
            decoration: InputDecoration(
              labelText: 'รหัสผ่าน',
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              login();
            },
            child: Text('เข้าสู่ระบบ'),
          ),
        ],
      ),
    );
  }
}
