import 'package:flutter/material.dart';
import 'package:flutter_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PopBaseScreen extends StatelessWidget {
  const PopBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              final res = await context.pushNamed("return");

              print(res);
            },
            child: Text("POP"),
          ),
        ],
      ),
    );
  }
}
