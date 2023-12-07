import 'package:flutter/material.dart';
import 'package:proyecto_restaurante/pages/Login.dart';
import 'package:proyecto_restaurante/pages/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
