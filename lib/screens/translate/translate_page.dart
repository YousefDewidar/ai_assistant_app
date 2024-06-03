import 'package:ai_assistant_app/screens/translate/widgets/custom_divider.dart';
import 'package:ai_assistant_app/screens/translate/widgets/custom_input.dart';
import 'package:ai_assistant_app/screens/translate/widgets/words_and_icon.dart';
import 'package:ai_assistant_app/widgets/custom_app_bar.dart';
import 'package:ai_assistant_app/widgets/custom_lang_butt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';

class TransPage extends StatefulWidget {
  const TransPage({super.key});

  @override
  State<TransPage> createState() => _TransPageState();
}

class _TransPageState extends State<TransPage> {
  TextEditingController transController = TextEditingController();
  final translator = GoogleTranslator();

  bool isVisible = false;
  String wordsTranslated = '';
  String lang1 = 'English';
  String lang2 = 'Arabic';
  final List langName = [];

  final Map<String, String> languageCodes = {
    'English': 'en',
    'Arabic': 'ar',
    'French': 'fr',
    'Spanish': 'es',
    'German': 'de',
    'Italian': 'it',
    'Portuguese': 'pt',
    'Russian': 'ru',
    'Japanese': 'ja',
    'Korean': 'ko',
    'Chinese': 'zh',
    'Hindi': 'hi',
    'Bengali': 'bn',
    'Urdu': 'ur',
    'Malay': 'ms',
    'Vietnamese': 'vi',
    'Thai': 'th',
    'Turkish': 'tr',
    'Polish': 'pl',
  };

  void getKeyFromMap() {
    for (String key in languageCodes.keys) {
      langName.add(key);
    }
  }

  void showBottomSheet({required int numButton}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        getKeyFromMap();
        return Container(
          height: 500,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: langName.length,
            itemBuilder: (context, index) {
              return TextButton(
                  onPressed: () {
                    if (numButton == 1) {
                      lang1 = langName[index];
                    } else {
                      lang2 = langName[index];
                    }
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Text(langName[index]));
            },
          ),
        );
      },
    );
  }

  Future<void> copyToClipboard({required text}) async {
    // Create a ClipboardData object with the text you want to copy
    ClipboardData data = ClipboardData(text: text);
    // Copy the data to the clipboard
    await Clipboard.setData(data);
  }

  Future<void> translateFromTo(
      {required String input,
      required String lnFrom,
      required String lnTo}) async {
    await translator
        .translate(input, from: lnFrom, to: lnTo)
        .then((value) => wordsTranslated = value.toString());
    setState(() {});
  }

  void translateTextField(String value) {
    if (value != '') {
      translateFromTo(
          input: transController.text,
          lnFrom: languageCodes[lang1]!,
          lnTo: languageCodes[lang2]!);
      isVisible = true;
      setState(() {});
    } else {
      isVisible = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: customAppBar(title: 'Translate'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // text field
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(188, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  CustomTextFieldForTranslate(
                    transController: transController,
                    lang1: lang1,
                    translateTextField: translateTextField,
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Column(
                      children: [
                        const CustomDivider(),
                        WordsAndIconAfterTranslate(
                          copyToClipboard: copyToClipboard,
                          wordsTranslated: wordsTranslated,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Buttons
          Container(
            height: 140,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLangButton(
                  numButton: 1,
                  lang: lang1,
                  showBottomSheet: showBottomSheet,
                ),
                IconButton(
                  onPressed: () {
                    String temp = lang1;
                    lang1 = lang2;
                    lang2 = temp;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.swap_horizontal_circle_sharp,
                    size: 31,
                    color: Colors.deepPurpleAccent[100],
                  ),
                ),
                CustomLangButton(
                  numButton: 2,
                  lang: lang2,
                  showBottomSheet: showBottomSheet,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
