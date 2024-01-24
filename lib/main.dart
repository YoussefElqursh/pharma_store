import 'package:flutter/material.dart';

void main() {
  runApp(const PharmaStore());
}

class PharmaStore extends StatelessWidget {
  const PharmaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
