import 'package:flutter/material.dart';

import '../Dados_mock.dart';

class CursosTela extends StatefulWidget {
  final List<Curso> favoritos;
  final void Function(Curso curso, bool adicionar) onFavoritarAlterado;

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

  String pesquisa = '';

  @override
  void dispose() {
    pesquisaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cursosFiltrados = cursos.where((curso) {
      return curso.nome.toLowerCase().contains(pesquisa.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
        centerTitle: true,
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
              child: cursosFiltrados.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum curso encontrado.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cursosFiltrados.length,
                      itemBuilder: (context, index) {
                        final curso = cursosFiltrados[index];
                        final estaFavoritado = widget.favoritos.contains(curso);

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: Icon(
                              curso.icone,
                              size: 35,
                            ),
                            title: Text(
                              curso.nome,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${curso.descricao}\n${curso.quantidadeAulas} aulas',
                            ),
                            isThreeLine: true,
                            trailing: IconButton(
                              onPressed: () {
                                widget.onFavoritarAlterado(curso, !estaFavoritado);
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
