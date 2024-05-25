import 'package:event_planner/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.event),
        title: const Text('Log In '),
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
            const TextField(
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return RegistrationScreen();
                        },
                      ));
                    },
                    child: const Text(
                      'no account?',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Log In'))
          ],
        ),
      ),
    );
  }
}
