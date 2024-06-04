import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ImageApi {
  Future<Uint8List> generateImage({required String imageName}) async {
    var url = Uri.parse("https://api.edenai.run/v2/image/generation");

    Map<String, dynamic> payload = {
      "response_as_dict": true,
      "attributes_as_list": false,
      "show_original_response": false,
      "num_images": 1,
      "providers": ["amazon"],
      "text": imageName,
      "resolution": "512x512"
    };

    var headers = {
      "accept": "application/json",
      "content-type": "application/json",
      "authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjdkNTRkYmYtZjY2Ny00YWNiLTk4ZDgtYmMzY2M5YmQwZmQxIiwidHlwZSI6ImFwaV90b2tlbiJ9.474n7EyHljkG5MdJpFexj2OpRJoRbyF5CoNXNdVSV9g"
    };

    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> resMap = jsonDecode(response.body);
      String imgUrl = resMap['amazon']['items'][0]['image'];
      var base64Image = base64Decode(imgUrl);

      return base64Image;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return Uint8List(1);
    }
  }
}
