import 'package:flutter/widgets.dart';
import 'package:flutter_router/layout/default_layout.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Basic Screen'),
          Text('This is a basic screen with no additional features.'),
          Text('You can add more widgets here as needed.'),
        ],
      ),
    );
  }
}
