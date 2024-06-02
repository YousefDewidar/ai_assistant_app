
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // line
        const SizedBox(
          width: 300,
          child: Divider(
            indent: 70,
            endIndent: 10,
          ),
        ),
        // icon
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              size: 40,
              color: Colors.deepPurpleAccent,
            ))
      ],
    );
  }
}

