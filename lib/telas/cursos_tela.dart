import 'package:flutter/material.dart';

class CursosTela extends StatelessWidget {
  const CursosTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text('Dart Essencial'),
              subtitle: Text('Fundamentos da linguagem Dart'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('Flutter Básico'),
              subtitle: Text('Criação de aplicativos mobile'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.design_services),
              title: Text('Interface Mobile'),
              subtitle: Text('Criação de interfaces para aplicativos'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.api),
              title: Text('Conexão com API'),
              subtitle: Text('Aprenda a consumir APIs'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.storage),
              title: Text('Banco de Dados'),
              subtitle: Text('Conceitos básicos de banco de dados'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.developer_mode),
              title: Text('Desenvolvimento Mobile'),
              subtitle: Text('Desenvolvimento de aplicativos'),
            ),
          ),
        ],
      ),
    );
  }
}