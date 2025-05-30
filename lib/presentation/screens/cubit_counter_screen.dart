import 'package:flutter/material.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh_outlined)),
        ],
      ),
      body: Center(child: const Text('Counter Value: xxxx')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {},
            child: const Text('+3'),
          ),

          const SizedBox(height: 16),

          FloatingActionButton(
            heroTag: '2',
            onPressed: () {},
            child: const Text('+2'),
          ),

          const SizedBox(height: 16),

          FloatingActionButton(
            heroTag: '3',
            onPressed: () {},
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
