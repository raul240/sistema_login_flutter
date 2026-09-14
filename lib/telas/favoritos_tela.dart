import 'package:flutter/material.dart';

class FavoritosTela extends StatelessWidget {
  const FavoritosTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('Flutter Básico'),
              subtitle: Text('Criação de aplicativos mobile'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('Dart Essencial'),
              subtitle: Text('Fundamentos da linguagem Dart'),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('Banco de Dados'),
              subtitle: Text('Conceitos básicos de banco de dados'),
            ),
          ),
        ],
      ),
    );
  }
}