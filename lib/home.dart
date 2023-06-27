import 'package:flutter/material.dart';
import 'second.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: const Text('I\'m in the center')),
            SizedBox(height: 40),
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Second(),
              )),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
