import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const CustomButton({super.key, required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 47,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          enableFeedback: true,
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          backgroundColor:
              const MaterialStatePropertyAll(Colors.deepPurpleAccent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
