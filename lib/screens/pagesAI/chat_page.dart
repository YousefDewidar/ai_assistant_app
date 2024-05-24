import 'package:ai_assistant_app/api/chat_service.dart';
import 'package:ai_assistant_app/widgets/custom_button.dart';
import 'package:ai_assistant_app/widgets/custom_text_input.dart';
import 'package:ai_assistant_app/widgets/suggestions_card.dart';
import 'package:ai_assistant_app/widgets/suggestions_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller = TextEditingController();
  double heightContainer = 100;
  double heightRobot = 120;
  double heightSpace = 180;

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
              margin: const EdgeInsets.only(top: 15),
              height: heightRobot,
              duration: const Duration(seconds: 1),
              child: Lottie.asset('assets/images/chat_robot.json',
                  width: 120, height: 120),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'How can I help you today',
              style: TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(207, 139, 139, 139),
                  fontWeight: FontWeight.w600),
            ),
            AnimatedContainer(
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
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                SuggestionsCard(
                  controller: controller,
                  width: 120,
                  suggestion: 'Health & food',
                ),
                const Spacer(),
                SuggestionsCard(
                  controller: controller,
                  width: 70,
                  suggestion: 'Weather',
                ),
                const Spacer(),
                SuggestionsCard(
                  controller: controller,
                  width: 90,
                  suggestion: 'The prices',
                ),
                const Spacer(),
                SuggestionsCard(
                  controller: controller,
                  width: 55,
                  suggestion: 'News',
                ),
                const Spacer(flex: 2),
              ],
            ),
            SuggestionsView(
              controller: controller,
              heightSpace: heightSpace,
            ),
            CustomTextInput(
              controller: controller,
              hint: 'Enter what you want here',
              suffIcon: Icons.close,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                title: 'Search',
                onPressed: () {
                  if (controller.text == '') {
                    heightContainer = 100;
                    heightRobot = 120;
                    heightSpace = 180;
                    setState(() {});
                  } else {
                    heightContainer = 300;
                    heightRobot = 0;
                    heightSpace = 50;
                    setState(() {});
                  }
                }),
              
          ],
        ),
      ),
    );
  }
}
