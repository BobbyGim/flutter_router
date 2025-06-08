import 'package:flutter/material.dart';

class NestedChildScreen extends StatelessWidget {
  final String routedName;

  const NestedChildScreen({super.key, required this.routedName});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(routedName));
  }
}
