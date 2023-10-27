import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_openai/constants/open_ai.dart';
import 'package:flutter_openai/models/open_ai.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GptData> getRecommendations({
    required String price,
    required String camera,
    required String storage,
  }) async {
    late GptData gptData = GptData(
        id: "",
        object: "",
        created: 0,
        model: "",
        choices: [],
        usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0));

    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      };

      String promptData =
          'You are a phone expert. Please give me recommendations of smartphone with price equal or less with IDR $price, $camera, and minimum $storage storage. Explain the brief specification of the smartphones.';

      final data = jsonEncode({
        "model": "gpt-3.5-turbo-instruct",
        "prompt": promptData,
        "temperature": 1,
        "max_tokens": 512,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      var response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Error occured when sending request.');
    }

    return gptData;
  }
}
