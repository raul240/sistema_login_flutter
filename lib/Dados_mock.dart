
import 'package:flutter/material.dart';

class Curso {
  final String nome;
  final String descricao;
  final int quantidadeAulas;
  final IconData icone;

  Curso({
    required this.nome,
    required this.descricao,
    required this.quantidadeAulas,
    required this.icone,
  });
}

final List<Curso> cursos = [
  Curso(
    nome: 'Dart Essencial',
    descricao: 'Aprenda os fundamentos da linguagem Dart.',
    quantidadeAulas: 10,
    icone: Icons.code,
  ),
  Curso(
    nome: 'Flutter Básico',
    descricao: 'Aprenda a criar aplicativos mobile com Flutter.',
    quantidadeAulas: 12,
    icone: Icons.phone_android,
  ),
  Curso(
    nome: 'Interface Mobile',
    descricao: 'Aprenda a criar interfaces para aplicativos.',
    quantidadeAulas: 8,
    icone: Icons.design_services,
  ),
  Curso(
    nome: 'Conexão com API',
    descricao: 'Aprenda a conectar aplicativos com APIs.',
    quantidadeAulas: 10,
    icone: Icons.api,
  ),
  Curso(
    nome: 'Banco de Dados',
    descricao: 'Aprenda conceitos básicos de banco de dados.',
    quantidadeAulas: 14,
    icone: Icons.storage,
  ),
  Curso(
    nome: 'Desenvolvimento Mobile',
    descricao: 'Aprenda conceitos de desenvolvimento mobile.',
    quantidadeAulas: 12,
    icone: Icons.smartphone,
  ),
];

List<Curso> favoritos = [
  cursos[0],
  cursos[1],
  cursos[2],
];
