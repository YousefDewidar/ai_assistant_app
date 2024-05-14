// ignore_for_file: prefer_const_constructors

import 'package:ai_assistant_app/screens/ai_assistant_page.dart';
import 'package:ai_assistant_app/widgets/custombutton.dart';
import 'package:ai_assistant_app/widgets/dots_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecPage extends StatelessWidget {
  const SecPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 120,
        ),

        // animated image
        Lottie.asset(
          'assets/images/ai_play.json',
          width: double.infinity,
          height: 300,
        ),
        const Spacer(),

        Text(
          'Imagination to Reality',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(217, 0, 0, 0),
              fontWeight: FontWeight.w900),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            textAlign: TextAlign.center,
            'Just Imagine anything & let me know, I will create something wonderful for you!',
            style: TextStyle(
              letterSpacing: .5,
              height: 1.3,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),

        const Spacer(),

        // two dots
        DotsWidget(numPage: 1,),


        const Spacer(),
      // Button --> Next
      CustomButton(title:'Go', namePage: AiChoosePage(),),  const Spacer(),
      ]),
    );
  }
}
