import 'package:flutter/material.dart';
import 'package:newpry/presentation/dbz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DbzScreen());
  }
}
