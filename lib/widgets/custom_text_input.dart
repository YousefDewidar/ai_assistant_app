import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextInput extends StatelessWidget {
  CustomTextInput(
      {super.key,
      required this.hint,
      this.preIcon,
      this.suffIcon,
      this.keyboardType,
      required this.controller});
  final String hint;
  final IconData? suffIcon;
  final IconData? preIcon;
  final TextEditingController controller;

  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(40, 17, 40, 0),
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(159, 227, 210, 255)),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 15),
          contentPadding: const EdgeInsets.all(18),
          suffixIcon: IconButton(
            onPressed: () {
              controller.text = '';
            },
            color: const Color.fromARGB(255, 211, 111, 104),
            icon: Icon(suffIcon),
          ),
        ),
      ),
    );
  }
}
