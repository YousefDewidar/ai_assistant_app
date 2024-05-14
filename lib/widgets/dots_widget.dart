import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DotsWidget extends StatelessWidget {
  int numPage;
  DotsWidget({super.key, required this.numPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 10,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 3, right: 4),
            width: 16,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: index == numPage
                  ? Colors.deepPurpleAccent
                  : Colors.deepPurpleAccent[100],
            ),
          );
        },
      ),
    );
  }
}
