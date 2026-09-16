import 'package:flutter/material.dart';

class EditarPerfilTela extends StatefulWidget {
  final String nomeAtual;
  final String emailAtual;

  const EditarPerfilTela({
    super.key,
    required this.nomeAtual,
    required this.emailAtual,
  });

  @override
  State<EditarPerfilTela> createState() => _EditarPerfilTelaState();
}

class _EditarPerfilTelaState extends State<EditarPerfilTela> {
  late TextEditingController nomeController;
  late TextEditingController emailController;
  late TextEditingController senhaController;

  @override
  void initState() {
    super.initState();

    nomeController = TextEditingController(text: widget.nomeAtual);
    emailController = TextEditingController(text: widget.emailAtual);
    senhaController = TextEditingController();
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  void salvar() {
    final nome = nomeController.text.trim();
    final email = emailController.text.trim();
    final senha = senhaController.text.trim();

    if (nome.isEmpty && email.isEmpty && senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha ao menos nome, e-mail ou senha.'),
        ),
      );
      return;
    }

    Navigator.pop(
      context,
      {
        'nome': nome.isNotEmpty ? nome : widget.nomeAtual,
        'email': email.isNotEmpty ? email : widget.emailAtual,
        'senha': senha,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              child: Icon(
                Icons.person,
                size: 45,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Nova senha',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: salvar,
                icon: const Icon(Icons.save),
                label: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}