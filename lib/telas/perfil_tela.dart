import 'package:flutter/material.dart';
import 'editar_perfil_tela.dart';

class PerfilTela extends StatefulWidget {
  final String nomeUsuario;
  final String emailUsuario;

  const PerfilTela({
    super.key,
    required this.nomeUsuario,
    required this.emailUsuario,
  });

  @override
  State<PerfilTela> createState() => _PerfilTelaState();
}

class _PerfilTelaState extends State<PerfilTela> {
  late String nome;
  late String email;

  @override
  void initState() {
    super.initState();

    nome = widget.nomeUsuario;
    email = widget.emailUsuario;
  }

  Future<void> editarPerfil() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarPerfilTela(
          nomeAtual: nome,
          emailAtual: email,
        ),
      ),
    );

    if (!mounted) return;

    if (resultado != null && resultado is Map<String, dynamic>) {
      setState(() {
        nome = resultado['nome'] ?? nome;
        email = resultado['email'] ?? email;
      });

      final senhaNova = resultado['senha']?.toString().trim() ?? '';

      if (senhaNova.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha alterada com sucesso!'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              child: Icon(
                Icons.person,
                size: 55,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              nome,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              child: ListTile(
                leading: const Icon(Icons.school),
                title: const Text('Curso atual'),
                subtitle: const Text(
                  'Desenvolvimento de Sistemas',
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text('Cursos'),
                subtitle: const Text(
                  '6 cursos disponíveis',
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.check_circle),
                title: const Text('Aulas concluídas'),
                subtitle: const Text(
                  '8 aulas',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: editarPerfil,
                icon: const Icon(Icons.edit),
                label: const Text('Editar perfil'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}