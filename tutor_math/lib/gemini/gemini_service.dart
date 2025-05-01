import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  final String _apiKey = ''; // Insira sua chave de API aqui

  Future<String> generateText(String prompt) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$_apiKey',
    );

    final body = {
      "contents": [
        {
          "parts": [
            {"text": prompt}
          ]
        }
      ]
    };

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data['candidates'][0]['content']['parts'][0]['text'];
      return text ?? 'Sem resposta do Gemini';
    } else {
      throw Exception('Erro na API Gemini: ${response.statusCode} - ${response.body}');
    }
  }
}
