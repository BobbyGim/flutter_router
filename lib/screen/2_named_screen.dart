import 'package:flutter/widgets.dart';
import 'package:flutter_router/layout/default_layout.dart';

class NamedScreen extends StatelessWidget {
  const NamedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(body: ListView());
  }
}
