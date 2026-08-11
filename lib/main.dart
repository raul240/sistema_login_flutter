import 'package:aula_vitor_2/pages/Login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}


class MeuApp extends StatelessWidget{
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sistema de login',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true
      ),
      home: const LoginPage(),
    );
  }
}