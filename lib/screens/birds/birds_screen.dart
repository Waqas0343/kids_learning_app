import 'package:flutter/material.dart';

class BirdsScreen extends StatelessWidget {
  const BirdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Birds'),
        backgroundColor: Colors.purple.shade400,
      ),
    );
  }
}
