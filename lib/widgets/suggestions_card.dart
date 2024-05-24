import 'package:flutter/material.dart';

class SuggestionsCard extends StatelessWidget {
  final double width;
  final String suggestion;
  final TextEditingController controller;
  const SuggestionsCard(
      {super.key,
      required this.width,
      required this.suggestion,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.text = '$suggestion now';
      },
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 35,
        decoration: BoxDecoration(
          color:const Color.fromARGB(44, 169, 81, 175),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          suggestion,
          style:const TextStyle(color: Color.fromARGB(222, 24, 18, 1)),
        ),
      ),
    );
  }
}
