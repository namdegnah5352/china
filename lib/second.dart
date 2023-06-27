import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(child: const Text('I\'m in the center')),
      ),
    );
  }
}
