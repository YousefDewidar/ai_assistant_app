import 'package:flutter/material.dart';

class CustomTextFieldForTranslate extends StatelessWidget {
  const CustomTextFieldForTranslate(
      {super.key,
      required this.transController,
      required this.translateTextField,
      required this.lang1});
  final TextEditingController transController;
  final Function translateTextField;
  final String lang1;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: transController,
      onChanged: (value) {
        translateTextField(value);
      },
      autocorrect: true,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: lang1 == 'Arabic' ? 'ادخل النص' : 'Enter text',
        hintTextDirection:
            lang1 == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
        hintStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        contentPadding: const EdgeInsets.all(18),
      ),
      textDirection: lang1 == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
    );
  }
}
