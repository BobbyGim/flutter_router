import 'package:flutter/material.dart';
import 'package:flutter_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class QueryParamScreen extends StatelessWidget {
  const QueryParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text("path Param"),
          ElevatedButton(
            onPressed: () {
              context.go("/path_param/123/abc");
            },
            child: Text("path Param Screen1"),
          ),
        ],
      ),
    );
  }
}
