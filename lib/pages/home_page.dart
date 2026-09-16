import 'package:flutter/material.dart';

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
  final List<String> favoritos = [];

  void alterarFavorito(String nomeCurso, bool adicionar) {
    setState(() {
      if (adicionar) {
        if (!favoritos.contains(nomeCurso)) {
          favoritos.add(nomeCurso);
        }
      } else {
        favoritos.remove(nomeCurso);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final telas = [
      InicioTela(
        nomeUsuario: widget.nomeUsuario,
      ),
      CursosTela(
        favoritos: favoritos,
        onFavoritarAlterado: alterarFavorito,
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