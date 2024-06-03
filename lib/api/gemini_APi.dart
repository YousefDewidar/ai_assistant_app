import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiApi {
  String apiKey = const String.fromEnvironment('API_KEY',
      defaultValue: 'AIzaSyBx-P_NE-6CT8WDW7Hgmr_Tx4mlBEqAdFg');

// ====  ====  ====  ====  ====   ====  ====  ====  ====  ====

  Future<String> getTextFromAi({required String q}) async {
  GenerativeModel model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    // requiest
    final content = [Content.text(q)];

    // response
    final response = await model.generateContent(content);
    return response.text!;

    
  }

}


