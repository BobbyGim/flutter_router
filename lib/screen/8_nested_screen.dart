import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedScreen extends StatelessWidget {
  final Widget child;

  const NestedScreen({super.key, required this.child});

  static final tabs = ['/nested/a', '/nested/b', '/nested/c'];

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return tabs.indexWhere((path) => location.startsWith(path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(GoRouterState.of(context).path.toString())),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "person"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "notifications",
          ),
        ],
        currentIndex: _getCurrentIndex(context),
        onTap: (index) {
          context.go(tabs[index]);
        },
      ),
    );
  }
}
