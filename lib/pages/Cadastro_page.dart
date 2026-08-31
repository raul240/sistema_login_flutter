import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  late TextEditingController nomeController;
  late TextEditingController emailController;
  late TextEditingController senhaController;
  late TextEditingController confirmarsenhaController;
  bool esconderSenha = true;
  bool esconderconfirmacao = true;

  void cadastrar() {
    String nome = nomeController.text.trim();
    String email = emailController.text.trim();
    String senha = senhaController.text;
    String confirmaSenha = confirmarsenhaController.text;

    if (nome.isEmpty ||
        email.isEmpty ||
        senha.isEmpty ||
        confirmaSenha.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Preencha todos os campos')));
      return;
    }

    if (senha != confirmaSenha) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas não correspondem')),
      );
      return;
    }

    if (senha.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A senha deve possuir pelo menos 4 caracteres'),
        ),
      );
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    emailController = TextEditingController();
    senhaController = TextEditingController();
    confirmarsenhaController = TextEditingController();
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmarsenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar usuário'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 15),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'nome',
                  hintText: 'digite seu nome',
                  prefixIcon: Icon(Icons.block),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'email',
                  hintText: 'digite seu email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: senhaController,
                obscureText: esconderSenha,
                decoration: InputDecoration(
                  labelText: 'senha',
                  prefixIcon: const Icon(Icons.block),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        esconderSenha = !esconderSenha;
                      });
                    },
                    icon: Icon(
                      esconderSenha ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: confirmarsenhaController,
                obscureText: esconderconfirmacao,
                decoration: InputDecoration(
                  labelText: 'confirmar senha',
                  prefixIcon: const Icon(Icons.block),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        esconderconfirmacao = !esconderconfirmacao;
                      });
                    },
                    icon: Icon(
                      esconderconfirmacao
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: () => cadastrar(),
                icon: const Icon(Icons.person_add, size: 18),
                label: const Text('Cadastrar', style: TextStyle(fontSize: 14)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  minimumSize: Size.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
