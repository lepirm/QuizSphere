import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/app/data/models/question/question.dart';

class HomeController extends GetxController {
  final apiResponse = "test me".obs;
  final loading = false.obs;
  final question = Rxn<Question>();
  final terrain = "History".obs;
  final isAnsTrue = Rxn<bool>();

  void checkCorrect(String s) => s == question.value!.correctAnswer!
      ? isAnsTrue.value = true
      : isAnsTrue.value = false;

  Future<void> fetchApi() async {
    loading.value = true;
    const apiKey =
        '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'; // Replace with your actual API key
    const url = 'https://openrouter.ai/api/v1/chat/completions';
    final Map<String, dynamic> body = {
      'model': 'openai/gpt-3.5-turbo',
      'messages': [
        {
          'role': 'user',
          'content': 'Please provide a question that has something to do with $terrain JSON response in the following format: '
              '{"question": "", "answers": ["answer1", "answer2", "answer3", "answer4"], "correctAnswer": "answer1"}. '
              'Only include the JSON object without any additional text.'
              'DO NOT REPEAT QUESTIONS FROM PREVIOUS REQUESTS YOU HAVE A BUNCH TO CHOOSE FROM'
        }
      ],
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      try {
        final jsonResponse =
            jsonDecode(responseData['choices'][0]['message']['content']);
        question.value = QuestionMapper.fromMap(jsonResponse);
      } catch (e) {
        Get.showSnackbar(const GetSnackBar(title: "ERROR"));
      } finally {
        loading.value = false;
        isAnsTrue.value = null;
      }
    } else {
      Get.showSnackbar(
        const GetSnackBar(title: "Request error"),
      );
    }
  }
}
