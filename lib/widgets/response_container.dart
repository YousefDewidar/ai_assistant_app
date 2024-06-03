
import 'package:ai_assistant_app/api/chat_service.dart';
import 'package:ai_assistant_app/api/image_service.dart';
import 'package:flutter/material.dart';

class ResponseContainer extends StatelessWidget {
  const ResponseContainer({
    super.key,
    required this.heightContainer,
    this.isImageRes = false,
    required this.controller,
  });

  final double heightContainer;
  final bool isImageRes;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: heightContainer,
      curve: Curves.decelerate,
      child: Container(
        width: double.infinity,
        height: 250,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 5),
                  color: Color.fromARGB(71, 159, 157, 157),
                  blurRadius: 20)
            ],
            border: Border.all(
                color: const Color.fromARGB(111, 104, 58, 183)),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white),
        child:
        
        isImageRes?ImageService(question: controller.text,) : ChatService(
          question: controller.text,
        ),
      ),
    );
  }
}
