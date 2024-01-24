import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/styles/colors.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: HexColor(primaryColor)),
        useMaterial3: true,
      ),
    );
  }
}
