import 'package:flutter/material.dart';

import '../Dados_mock.dart';

class FavoritosTela extends StatelessWidget {
  final List<Curso> favoritos;

  const FavoritosTela({
    super.key,
    required this.favoritos,
  });

  @override
  Widget build(BuildContext context) {
    final cursosFavoritos = cursos.where(
      (curso) => favoritos.contains(curso),
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: cursosFavoritos.isEmpty
          ? const Center(
              child: Text('Nenhum curso favorito ainda.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cursosFavoritos.length,
              itemBuilder: (context, index) {
                final curso = cursosFavoritos[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Icon(
                      curso.icone,
                      color: Colors.red,
                    ),
                    title: Text(curso.nome),
                    subtitle: Text(
                      '${curso.descricao}\n${curso.quantidadeAulas} aulas',
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}