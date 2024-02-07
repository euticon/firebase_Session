// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:firebasesesh/isSignedin.dart';
import 'package:flutter/material.dart';
import 'notesscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) {
                setState(() {
                  emailController.text = value;
                });
              },
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              onChanged: (value) {
                setState(() {
                  passwordController.text = value;
                });
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                createUser(emailController.text, passwordController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotesScreen()),
                );
              },
              icon: Icon(Icons.mail),
              label: Text('SignUp'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                signIn(emailController.text, passwordController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotesScreen()),
                );
              },
              icon: Icon(Icons.mail),
              label: Text('SignIn'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                _signin() async {
                  FirebaseAuth.instance.authStateChanges().listen((User? user) {
                    if (user == null) {
                      print('User is currently signed out!');
                    } else {
                      print('User is signed in!');
                    }
                  });
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotesScreen()),
                );
              },
              icon: Icon(Icons.mail),
              label: Text('Login via Email'),
            ),
          ],
        ),
      ),
    );
  }
}
