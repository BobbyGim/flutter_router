import 'package:flutter/material.dart';
import 'package:flutter_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.pushNamed("basic");
            },
            child: Text("Push Basic"),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed("basic");
            },
            child: Text("Go Basic"),
          ),
        ],
      ),
    );
  }
}
