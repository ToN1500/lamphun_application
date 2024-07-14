import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lamphun_application/config/app.dart';
import 'package:lamphun_application/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  
  @override
Future<void> checkLogin() async {
  bool loggedIn = await AuthService().checkLogin();
  if (loggedIn) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}
  Future<void> login() async {
    bool loggedIn = await AuthService().login(_email.text, _password.text);
    if (loggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
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
