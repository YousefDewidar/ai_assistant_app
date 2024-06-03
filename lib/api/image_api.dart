import 'dart:convert';

import 'package:http/http.dart' as http;

class ImageApi {
  var baseUrl = 'https://api.limewire.com/api/image/generation';

  Future<String> generateImage(String prompt,
      {String negativePrompt = '',
      int samples = 2,
      String quality = 'LOW',
      int guidanceScale = 50,
      String aspectRatio = '1:1',
      String style = 'PHOTOREALISTIC'}) async {
    final Map<String, dynamic> payload = {
      'prompt': prompt,
      'negative_prompt': negativePrompt,
      'samples': samples,
      'quality': quality,
      'guidance_scale': guidanceScale,
      'aspect_ratio': aspectRatio,
      'style': style,
    };

    final headers = {
      'Content-Type': 'application/json',
      'X-Api-Version': 'v1',
      'Accept': 'application/json',
      'Authorization':
          'Bearer lmwr_sk_xsvbGQebUQ_Df1pJ3PrcnnH18F44fcdedyrc9cE6dGIhViS6', // Replace with your API key
    };

    final response = await http.post(Uri.parse(baseUrl),
        headers: headers, body: jsonEncode(payload));

    if (response.statusCode == 200) {
      Map<String, dynamic> res =
          jsonDecode(response.body) as Map<String, dynamic>;
      String imageUrl = res['data'][0]['asset_url'];

      return imageUrl;
    } else {
      throw Exception('Failed to generate image: ${response.statusCode}');
    }
  }
}
