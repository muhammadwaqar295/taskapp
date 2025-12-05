import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen A'), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pushNamed('b'),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: Text('Go to Screen B', style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
