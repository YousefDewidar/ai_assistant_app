import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomLangButton extends StatelessWidget {
  String lang;
  Function showBottomSheet;
  final int numButton;
  CustomLangButton(
      {super.key, required this.lang, required this.showBottomSheet,required this.numButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(25))),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 17.2, fontWeight: FontWeight.w500)),
          fixedSize: const MaterialStatePropertyAll(Size(140, 50)),
          enableFeedback: true,
          foregroundColor: const MaterialStatePropertyAll(Color(0xFFFFFFFF)),
          backgroundColor:
              const MaterialStatePropertyAll(Colors.deepPurpleAccent),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: () {
          showBottomSheet(numButton : numButton);
        },
        child: Text(lang));
  }
}
