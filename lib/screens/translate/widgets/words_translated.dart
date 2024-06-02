
import 'package:flutter/material.dart';

class WordsTranslated extends StatelessWidget {
  const WordsTranslated({
    super.key,
    required this.wordsTranslated,
  });

  final String wordsTranslated;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        wordsTranslated,
        style: const TextStyle(
          color: Color.fromARGB(255, 84, 26, 183),
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
