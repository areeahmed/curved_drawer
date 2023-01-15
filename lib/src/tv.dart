import 'package:flutter/material.dart';

class Tv extends StatelessWidget {
  const Tv({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('TV Page'),
        ],
      ),
    );
  }
}
