import 'package:flutter/material.dart';

import '../Dados_mock.dart';
import '../telas/inicio_tela.dart';
import '../telas/cursos_tela.dart';
import '../telas/favoritos_tela.dart';
import '../telas/perfil_tela.dart';

class HomePage extends StatefulWidget {
  final String nomeUsuario;
  final String emailUsuario;

  const HomePage({
    super.key,
    required this.nomeUsuario,
    required this.emailUsuario,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    final telas = [
      InicioTela(
        nomeUsuario: widget.nomeUsuario,
      ),
      CursosTela(
        favoritos: favoritos,
        onFavoritarAlterado: (curso, adicionar) {
          setState(() {
            if (adicionar) {
              if (!favoritos.contains(curso)) {
                favoritos.add(curso);
              }
            } else {
              favoritos.remove(curso);
            }
          });
        },
      ),
      FavoritosTela(
        favoritos: favoritos,
      ),
      PerfilTela(
        nomeUsuario: widget.nomeUsuario,
        emailUsuario: widget.emailUsuario,
      ),
    ];

    return Scaffold(
      body: telas[paginaSelecionada],

      bottomNavigationBar: NavigationBar(
        selectedIndex: paginaSelecionada,

        onDestinationSelected: (index) {
          setState(() {
            paginaSelecionada = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.school),
            label: 'Cursos',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

