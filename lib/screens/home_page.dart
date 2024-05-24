// ignore_for_file: prefer_const_constructors
import 'package:ai_assistant_app/screens/ai_assistant_page.dart';
import 'package:ai_assistant_app/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 80,
        ),
        //  Text --> Welcome
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(217, 0, 0, 0),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'AI chat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // animated image
        Lottie.asset(
          'assets/images/Animation - 1715413486579.json',
          width: double.infinity,
          height: 350,
        ),
        const Spacer(),

        Text(
          'Ask me Anything',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(217, 0, 0, 0),
              fontWeight: FontWeight.w900),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            textAlign: TextAlign.center,
            'I can be your Best Friend & You can ask me anything & I will help you!',
            style: TextStyle(
              letterSpacing: .5,
              height: 1.3,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
        const Spacer(),
        CustomButton(title: 'Go', namePage: AiChoosePage()),
        const Spacer(),
      ]),
    );
  }
}

// ignore: must_be_immutable
