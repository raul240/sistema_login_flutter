
import 'package:flutter/material.dart';
import '../Dados_mock.dart';

class CursoCard extends StatelessWidget {
  final Curso curso;
  final bool favorito;
  final VoidCallback aoFavoritar;

  const CursoCard({
    super.key,
    required this.curso,
    required this.favorito,
    required this.aoFavoritar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              child: Icon(curso.icone),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    curso.nome,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(curso.descricao),

                  const SizedBox(height: 5),

                  Text(
                    '${curso.quantidadeAulas} aulas',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 8),

                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Acessando ${curso.nome}',
                          ),
                        ),
                      );
                    },
                    child: const Text('Acessar curso'),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: aoFavoritar,
              icon: Icon(
                favorito
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

