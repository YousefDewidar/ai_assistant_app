
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String title;
  Widget namePage;
  CustomButton({super.key, required this.title,required this.namePage});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 47,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return namePage;
              },
            ),
          );
        },
        style: ButtonStyle(
          enableFeedback: true,
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          backgroundColor:
              const MaterialStatePropertyAll(Colors.deepPurpleAccent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Text(title,
            style: const TextStyle(
              fontSize: 18,
            )),
      ),
    );
  }
}
