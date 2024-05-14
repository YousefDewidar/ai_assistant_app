// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ai_assistant_app/api/chat_service.dart';

import 'package:ai_assistant_app/widgets/CustomTextInput.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller = TextEditingController();
  double heightContainer = 100;
  double heightRobot = 120;
  double postionYrobot = 0;
  double heightSpace =180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI ChatBot',
          style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: .9,
        shadowColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              margin: EdgeInsets.only(top: 15),
                transform: Matrix4.translationValues(
                  0,
                  postionYrobot,
                  0,
                ),
                height: heightRobot,
                duration: Duration(seconds: 2),
                child: Lottie.asset('assets/images/chat_robot.json',
                    width: 120, height: 120)),
            const SizedBox(
              height: 25,
            ),
            Text(
              'How can I help you today',
              style: TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(207, 139, 139, 139),
                  fontWeight: FontWeight.w600),
            ),
            AnimatedContainer(
              
              duration: Duration(seconds: 1),
              height: heightContainer,
              curve: Curves.decelerate,
              child: Container(
                width: double.infinity,
                height: 250,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Color.fromARGB(134, 124, 77, 255),
                          blurRadius: 10)
                    ],
                    border: Border.all(
                        color: const Color.fromARGB(111, 104, 58, 183)),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: ChatService(
                  question: controller.text,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2),
                SuggestionsCard(
                  controller: controller,
                  width: 120,
                  suggestion: 'Health & food',
                ),
                Spacer(),
                SuggestionsCard(
                  controller: controller,
                  width: 70,
                  suggestion: 'Weather',
                ),
                Spacer(),
                SuggestionsCard(
                  controller: controller,
                  width: 90,
                  suggestion: 'The prices',
                ),
                Spacer(),
                SuggestionsCard(
                  controller: controller,
                  width: 55,
                  suggestion: 'News',
                ),
                Spacer(flex: 2),
              ],
            ),
            SizedBox(
              height: heightSpace,
            ),
            // ignore: missing_required_param
            CustomTextInput(
              controller: controller,
              hint: 'Enter what you want here',
              suffIcon: Icons.close,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 150,
              height: 47,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.text == '') {
                    heightContainer = 100;
                    heightRobot = 120;
                    postionYrobot = 0;
                    heightSpace = 180;
                    setState(() {});
                  } else {
                    heightContainer = 300;
                    heightRobot = 0;
                    postionYrobot = 900;
                    heightSpace = 50 ;
                    setState(() {});
                  }
                },
                style: ButtonStyle(
                  enableFeedback: true,
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.deepPurpleAccent),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: const Text('Search',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SuggestionsCard extends StatelessWidget {
  double width;
  String suggestion;
  TextEditingController controller;
  SuggestionsCard(
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
          color: Color.fromARGB(44, 169, 81, 175),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          suggestion,
          style: TextStyle(color: Color.fromARGB(222, 24, 18, 1)),
        ),
      ),
    );
  }
}
