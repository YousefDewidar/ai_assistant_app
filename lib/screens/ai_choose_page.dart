
import 'package:ai_assistant_app/screens/chat_page.dart';
import 'package:ai_assistant_app/screens/image_page.dart';
import 'package:ai_assistant_app/screens/translate/translate_page.dart';
import 'package:ai_assistant_app/widgets/ai_type_card.dart';
import 'package:flutter/material.dart';

class AiChoosePage extends StatelessWidget {
  const AiChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor: Colors.white,
        title: const Text(
          'AI Assistant',
          style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {

        //       },
        //       icon: Icon(
        //         Icons.dark_mode_outlined,
        //         color: Colors.deepPurple,
        //       ))
        // ],
      ),
      body:const Column(
        children:  [
          AiTypeCard(
            imgSrc: 'assets/images/ai_hand_waving.json',
            nameAi: 'AI helper',
            page: ChatPage(),
          ),
          AiTypeCard(
            imgSrc: 'assets/images/ai_play.json',
            nameAi: 'Generate images',
            heightImg: 100,
            widthImg: 150,
            direction: TextDirection.rtl,
            page: GenImagePage(),
          ),
          AiTypeCard(
            imgSrc: 'assets/images/Animation - 1715413486579.json',
            nameAi: 'Translator',
            widthImg: 160,
            heightImg: 180,
            page: TransPage(),
          ),
        ],
      ),
    );
  }
}
