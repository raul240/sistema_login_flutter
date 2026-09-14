import 'package:flutter/material.dart';

class PerfilTela extends StatelessWidget {
  final String nomeUsuario;
  final String emailUsuario;

  const PerfilTela({
    super.key,
    required this.nomeUsuario,
    required this.emailUsuario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              nomeUsuario,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(emailUsuario),

            const SizedBox(height: 30),

            const Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text('Curso atual'),
                subtitle: Text('Desenvolvimento de Sistemas'),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.library_books),
                title: Text('Cursos'),
                subtitle: Text('6 cursos disponíveis'),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.check_circle),
                title: Text('Aulas concluídas'),
                subtitle: Text('8 aulas'),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Editar perfil'),
            ),
          ],
        ),
      ),
    );
  }
}