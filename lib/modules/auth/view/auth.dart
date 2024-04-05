import 'package:flutter/material.dart';

import '../bloc/auth.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Auth'),
        ),
        body: const Column(
          children: <Widget>[
            // Material TextFields
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),

            // Material Buttons
            ElevatedButton(
              onPressed: null,
              child: Text('Sign In / Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
