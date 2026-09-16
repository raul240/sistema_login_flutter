import 'package:flutter/material.dart';

class InicioTela extends StatelessWidget {
  final String nomeUsuario;

  const InicioTela({
    super.key,
    required this.nomeUsuario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, $nomeUsuario!',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Curso em andamento',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Desenvolvimento Mobile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text('Progresso: 8 de 12 aulas'),

                    const SizedBox(height: 10),

                    LinearProgressIndicator(
                      value: 8 / 12,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Cursos disponíveis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Card(
              child: ListTile(
                leading: Icon(Icons.code),
                title: Text('Dart Essencial'),
                subtitle: Text('Aprenda os fundamentos da linguagem Dart.'),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.phone_android),
                title: Text('Flutter Básico'),
                subtitle: Text('Aprenda a criar aplicativos mobile.'),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Resumo do estudante',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Card(
              child: ListTile(
                leading: Icon(Icons.menu_book),
                title: Text('6 cursos disponíveis'),
                subtitle: Text('8 aulas concluídas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}