import 'package:ai_assistant_app/widgets/customLangButt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator/translator.dart';

// ignore: must_be_immutable
class TransPage extends StatefulWidget {
  const TransPage({super.key});

  @override
  State<TransPage> createState() => _TransPageState();
}

class _TransPageState extends State<TransPage> {
  TextEditingController transController = TextEditingController();
  final translator = GoogleTranslator();

  double heightCon = 140;
  double i = 0;
  bool isVisible = false;
  String wordsTranslated = '';
  String lang1 = 'English';
  String lang2 = 'Arabic';

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

  final List langName = [];

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

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Translate',
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
      body: Column(
        children: [
          // text field
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            height: screenHight - 105.5 - heightCon - i,
            padding: const EdgeInsets.symmetric(horizontal: 3),
            decoration: const BoxDecoration(
                color: Color.fromARGB(241, 254, 254, 254),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                TextField(
                  controller: transController,
                  onChanged: (value) {
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
                  },
                  onTap: () {
                    i = 280;
                    setState(() {});
                  },
                  onSubmitted: (value) async {
                    i = 0;
                    setState(() {});
                  },
                  // autocorrect: true,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: lang1 == 'Arabic' ? 'ادخل النص' : 'Enter text',
                    hintTextDirection: lang1 == 'Arabic'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    hintStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w400),
                    contentPadding: EdgeInsets.all(18),
                  ),
                  textDirection:
                      lang1 == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
                ),
                Visibility(
                  visible: isVisible,
                  child: Column(
                    children: [
                      Row(
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
                              onPressed: () {
                                i = 0;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 40,
                                color: Colors.deepPurpleAccent,
                              ))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(18),
                        height: 100,
                        width: screenWidth,
                        child: Row(
                          children: [
                            Text(
                              wordsTranslated,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 84, 26, 183),
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3),
                              child: IconButton(
                                  onPressed: () {
                                    copyToClipboard(text: wordsTranslated);
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.copy,
                                    color: Color.fromARGB(255, 84, 26, 183),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // buttons
          Container(
            height: heightCon,
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
