import 'package:flutter/material.dart';
import 'package:flutter_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Root Screen'),
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: Text('Go to Basic Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('named');
            },
            child: Text('Go to Named Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('push');
            },
            child: Text('push to Named Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('pop');
            },
            child: Text('Pop to Base Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/path_param/123');
            },
            child: Text('go path param screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push(
                Uri(
                  path: "/query_param",
                  queryParameters: {"name": "kim", "age": "30"},
                ).toString(),
              );
            },
            child: Text('go query param screen'),
          ),
        ],
      ),
    );
  }
}
