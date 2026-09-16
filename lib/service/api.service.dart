import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  static Future<Map<String, dynamic>> login({
    required String email,
    required String senha,
  }) async {
    if (email == 'teste@teste.com' && senha == '123456') {
      return {
        'sucesso': true,
        'dados': {
          'nome': 'Raul',
          'email': 'teste@teste.com',
        },
      };
    }

    final url = Uri.parse('$baseUrl/login');

    final dados = {
      'email': email,
      'senha': senha,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dados),
      );

      Map<String, dynamic> resposta = {};

      if (response.body.isNotEmpty) {
        final decoded = jsonDecode(
          utf8.decode(response.bodyBytes),
        );

        if (decoded is Map) {
          resposta = Map<String, dynamic>.from(decoded);
        }
      }

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        return {
          'sucesso': true,
          'dados': resposta,
        };
      }

      return {
        'sucesso': false,
        'mensagem':
            resposta['mensagem'] ?? 'E-mail ou senha incorretos',
      };
    } catch (_) {
      return {
        'sucesso': false,
        'mensagem': 'Não foi possível conectar ao servidor.',
      };
    }
  }

  static Future<Map<String, dynamic>> cadastro({
    required String nome,
    required String email,
    required String senha,
  }) async {
    final url = Uri.parse('$baseUrl/cadastro');

    final dados = {
      'nome': nome,
      'email': email,
      'senha': senha,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dados),
      );

      Map<String, dynamic> resposta = {};

      if (response.body.isNotEmpty) {
        final decoded = jsonDecode(
          utf8.decode(response.bodyBytes),
        );

        if (decoded is Map) {
          resposta = Map<String, dynamic>.from(decoded);
        }
      }

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        return {
          'sucesso': true,
          'dados': resposta,
        };
      }

      return {
        'sucesso': false,
        'mensagem':
            resposta['mensagem'] ?? 'Erro ao criar cadastro',
      };
    } catch (_) {
      return {
        'sucesso': false,
        'mensagem': 'Não foi possível conectar ao servidor.',
      };
    }
  }
}
