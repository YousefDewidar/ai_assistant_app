import 'package:ai_assistant_app/screens/translate/widgets/words_translated.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WordsAndIconAfterTranslate extends StatelessWidget {
  const WordsAndIconAfterTranslate(
      {super.key,
      required this.wordsTranslated,
      required this.copyToClipboard});
  final String wordsTranslated;
  final Function copyToClipboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          WordsTranslated(wordsTranslated: wordsTranslated),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: IconButton(
                onPressed: () {
                  copyToClipboard(text: wordsTranslated);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.copy,
                  color: Color.fromARGB(255, 84, 26, 183),
                )),
          ),
        ],
      ),
    );
  }
}
