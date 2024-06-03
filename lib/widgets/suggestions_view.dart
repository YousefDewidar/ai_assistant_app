import 'package:ai_assistant_app/widgets/suggestions_card.dart';
import 'package:flutter/material.dart';

class SuggestionsView extends StatelessWidget {
  const SuggestionsView({super.key, required this.controller, required this.heightSpace});
  final TextEditingController controller;
  final double heightSpace;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SuggestionsCard(
              controller: controller,
              width: 120,
              suggestion: 'Health & food',
            ),
            const SizedBox(
              width: 10,
            ),
            SuggestionsCard(
              controller: controller,
              width: 55,
              suggestion: 'News',
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
          height: heightSpace,
        ),
      ],
    );
  }
}
