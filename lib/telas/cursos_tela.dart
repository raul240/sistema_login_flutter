import 'package:flutter/material.dart';

class CursosTela extends StatefulWidget {
  final List<String> favoritos;
  final void Function(String nomeCurso, bool adicionar) onFavoritarAlterado;

  const CursosTela({
    super.key,
    required this.favoritos,
    required this.onFavoritarAlterado,
  });

  @override
  State<CursosTela> createState() => _CursosTelaState();
}

class _CursosTelaState extends State<CursosTela> {
  final TextEditingController pesquisaController =
      TextEditingController();

  final List<Map<String, dynamic>> cursos = [
    {
      'nome': 'Dart Essencial',
      'descricao': 'Aprenda os fundamentos da linguagem Dart.',
      'aulas': 10,
      'icone': Icons.code,
    },
    {
      'nome': 'Flutter Básico',
      'descricao': 'Aprenda a criar aplicativos mobile.',
      'aulas': 12,
      'icone': Icons.phone_android,
    },
    {
      'nome': 'Interface Mobile',
      'descricao': 'Aprenda a criar interfaces para aplicativos.',
      'aulas': 8,
      'icone': Icons.design_services,
    },
    {
      'nome': 'Conexão com API',
      'descricao': 'Aprenda a conectar seu aplicativo com APIs.',
      'aulas': 10,
      'icone': Icons.api,
    },
    {
      'nome': 'Banco de Dados',
      'descricao': 'Aprenda os conceitos básicos de banco de dados.',
      'aulas': 14,
      'icone': Icons.storage,
    },
    {
      'nome': 'Desenvolvimento Mobile',
      'descricao': 'Aprenda conceitos de desenvolvimento mobile.',
      'aulas': 12,
      'icone': Icons.smartphone,
    },
  ];

  String pesquisa = '';

  @override
  void dispose() {
    pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cursosFiltrados = cursos.where((curso) {
      final nome = curso['nome'].toString().toLowerCase();

      return nome.contains(pesquisa.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: pesquisaController,
              onChanged: (valor) {
                setState(() {
                  pesquisa = valor;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Pesquisar curso',
                hintText: 'Digite o nome do curso',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: cursosFiltrados.length,
                itemBuilder: (context, index) {
                  final curso = cursosFiltrados[index];
                  final nomeCurso = curso['nome'].toString();
                  final estaFavoritado = widget.favoritos.contains(nomeCurso);

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: Icon(
                        curso['icone'],
                        size: 35,
                      ),
                      title: Text(
                        nomeCurso,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${curso['descricao']}\n${curso['aulas']} aulas',
                      ),
                      isThreeLine: true,
                      trailing: IconButton(
                        onPressed: () {
                          widget.onFavoritarAlterado(nomeCurso, !estaFavoritado);
                        },
                        icon: Icon(
                          estaFavoritado ? Icons.favorite : Icons.favorite_border,
                          color: estaFavoritado ? Colors.red : null,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

