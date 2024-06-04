import 'package:ai_assistant_app/widgets/custom_app_bar.dart';
import 'package:ai_assistant_app/widgets/custom_button.dart';
import 'package:ai_assistant_app/widgets/custom_text_input.dart';
import 'package:ai_assistant_app/widgets/response_container.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenImagePage extends StatefulWidget {
  const GenImagePage({super.key});

  @override
  State<GenImagePage> createState() => _GenImagePageState();
}

class _GenImagePageState extends State<GenImagePage> {
  TextEditingController controller = TextEditingController();
  double heightContainer = 100;
  double heightRobot = 120;
  double heightSpace = 260;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Generate images'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              margin: const EdgeInsets.only(top: 15),
              height: heightRobot,
              duration: const Duration(seconds: 1),
              child: Lottie.asset('assets/images/ai_play.json',
                  width: 120, height: 120),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Imagine the image you want',
              style: TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(207, 139, 139, 139),
                  fontWeight: FontWeight.w600),
            ),
            ResponseContainer(
              heightContainer: heightContainer,
              controller: controller,
              isImageRes: true,
            ),
            SizedBox(
              height: heightSpace,
            ),
            CustomTextInput(
              controller: controller,
              hint: 'Describe the image you want',
              suffIcon: Icons.close,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                title: 'Generate',
                onPressed: () {
                  if (controller.text == '') {
                    heightContainer = 100;
                    heightRobot = 120;
                    heightSpace = 260;
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
