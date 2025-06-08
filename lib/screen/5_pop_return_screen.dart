import 'package:flutter/material.dart';
import 'package:flutter_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PopReturnScreen extends StatelessWidget {
  const PopReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              context.pop("code factory");
            },
            child: Text("Push Pop Return Screen1"),
          ),
        ],
      ),
    );
  }
}
