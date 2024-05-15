// ignore_for_file: prefer_const_constructors

import 'package:ai_assistant_app/api/getImgUrl.dart';
import 'package:ai_assistant_app/widgets/CustomTextInput.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenrateImgPage extends StatelessWidget {
  GenrateImgPage({
    super.key,
  });
  double heightContainer = 300;
  double heightRobot = 120;
  double heightSpace = 180;

  TextEditingController cc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Generate images',
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
              height: 120,
              duration: Duration(seconds: 1),
              child: Lottie.asset('assets/images/chat_robot.json',
                  width: 120, height: 120),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Just imagine the image you want',
              style: TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(207, 139, 139, 139),
                  fontWeight: FontWeight.w600),
            ),
            Image.network(
              height: 300,
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxuwOEuK8T8TPyHxRtEbu_6irxVw4SOwN_hqZ24mTN3A&s',
            ),
            const SizedBox(
              height: 0,
            ),
            CustomTextInput(
              controller: cc,
              hint: 'Enter what you want here',
              suffIcon: Icons.close,
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 150,
              height: 47,
              child: ElevatedButton(
                onPressed: () {
                  getImgUrl();
                },
                style: ButtonStyle(
                  enableFeedback: true,
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.deepPurpleAccent),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: const Text('Create',
                    style: TextStyle(
                      fontSize: 18,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
