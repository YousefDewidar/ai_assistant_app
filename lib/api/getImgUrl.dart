// use chat gpt to generate img url by text(user input)
import 'package:dart_openai/dart_openai.dart';

var apiGpt = 'sk-proj-cRQPDHk3rLx4ryUOKlUET3BlbkFJzA2tQJlavoSCDOSek7TR';

getImgUrl() async {
  OpenAI.apiKey = apiGpt;

  OpenAIImageModel image = await OpenAI.instance.image.create(
    prompt: 'egypt',
    n: 1,
    size: OpenAIImageSize.size1024,
    responseFormat: OpenAIImageResponseFormat.url,
  );


// Printing the output to the console.
  for (int index = 0; index < image.data.length; index++) {
    final currentItem = image.data[index];
    print(currentItem.url);
  }
}
