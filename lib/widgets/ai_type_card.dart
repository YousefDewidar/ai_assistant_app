// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AiTypeCard extends StatelessWidget {
  final String nameAi;
  final String imgSrc;
  final double? widthImg;
  final double? heightImg;
  final TextDirection? direction;
  final Widget page;

  const AiTypeCard({
    super.key,
    required this.nameAi,
    required this.imgSrc,
    required this.page,
    this.widthImg,
    this.heightImg,
    this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ));
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 150,
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color.fromARGB(80, 104, 58, 183),
        ),
        child: Row(
          textDirection: direction,
          children: [
            Lottie.asset(imgSrc, width: widthImg, height: heightImg),
            SizedBox(
              width: 0,
            ),
            Text(
              textAlign: TextAlign.center,
              nameAi,
              style: TextStyle(
                  color: Color.fromARGB(224, 9, 3, 19),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
