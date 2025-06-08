import 'package:flutter/material.dart';
import 'package:flutter_router/layout/default_layout.dart';
import 'package:flutter_router/router/router.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text("$authState "),
          ElevatedButton(
            onPressed: () {
              if (GoRouterState.of(context).fullPath == '/login') {
                context.go("/login/private");
              } else {
                context.go("/login2/private");
              }
            },
            child: Text('go to Private Screen'),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                authState = !authState;
              });
            },
            child: Text(authState ? 'Logout' : 'Login'),
          ),
        ],
      ),
    );
  }
}
