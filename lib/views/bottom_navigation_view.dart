import 'package:cash_tab/components/bottom_navigation.dart';
import 'package:flutter/material.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const AppNavigation(),
    );
  }
}
