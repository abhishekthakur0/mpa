import 'package:flutter/material.dart';

import '../bloc/auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AuthBloc(), child: const AuthView());
  }
}

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(state.message ?? 'An error occurred. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Authentication'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Material TextFields
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onChanged: (value) {
                    // Call the emailChanged method
                    context.read<AuthBloc>().add(AuthEmailChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    // Call the passwordChanged method
                    context.read<AuthBloc>().add(AuthPasswordChanged(value));
                  },
                ),
                const SizedBox(height: 20),
                // Material Buttons
                ElevatedButton(
                  onPressed: () {
                    // Call the signIn method
                    context.read<AuthBloc>().add(const AuthSignIn());
                  },
                  child: const Text('SIGN IN / SIGN UP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
