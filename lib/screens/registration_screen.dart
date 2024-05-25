import 'package:event_planner/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  final TextEditingController emailController =
      TextEditingController(text: "ragaca@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "salome890");
  final TextEditingController confirmController =
      TextEditingController(text: "salome890");

  void registerUser(BuildContext context) async {
    UserCredential creds =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    if (creds.user != null) {
      if (creds.user!.emailVerified == false) {
        creds.user!.sendEmailVerification();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("check mail")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.event),
        title: const Text('Sign Up '),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: confirmController,
              decoration: const InputDecoration(
                label: Text('Confirm Password'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Already registered',
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            ElevatedButton(
              onPressed: () {
                if (passwordController.text == confirmController.text) {
                  registerUser(context);
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
