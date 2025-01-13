import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud_data.dart';
import 'package:word_cloud/word_cloud_tap.dart';
import 'package:word_cloud/word_cloud_tap_view.dart';

import '../main.dart';

class WordCloudWidget extends StatefulWidget {
  final double swidth;
  final double sheight;
  final double minValue;
  final double maxValue;
  final void Function(String) filteredProjects;
  const WordCloudWidget(
      {super.key,
      required this.swidth,
      required this.sheight,
      required this.filteredProjects,
      required this.minValue,
      required this.maxValue});

  @override
  State<WordCloudWidget> createState() => _WordCloudWidgetState();
}

List<Map> wordList = [
  {'word': 'Dart/Flutter', 'value': 80},
  {'word': 'Javascript/NodeJS', 'value': 55},
  {'word': 'Typescript/NextJS', 'value': 65},
  {'word': 'Javascript/ReactJS', 'value': 60},
  {'word': 'Typescript/NodeJS', 'value': 55},
  {'word': 'Javascript', 'value': 50},
];

class _WordCloudWidgetState extends State<WordCloudWidget> {
  String wordstring = '';

  @override
  Widget build(BuildContext context) {
    WordCloudData wcdata = WordCloudData(data: wordList);
    WordCloudTap wordtaps = WordCloudTap();

    for (int i = 0; i < wordList.length; i++) {
      void tap() {
        wordstring = wordList[i]['word'];
        widget.filteredProjects(wordstring);
      }

      wordtaps.addWordtap(wordList[i]['word'], tap);
    }


    return WordCloudTapView(
      data: wcdata,
      wordtap: wordtaps,
      mintextsize: widget.minValue,
      maxtextsize: widget.maxValue,
      mapwidth: widget.swidth,
      mapheight: widget.sheight,
      fontWeight: FontWeight.bold,
      colorlist: [colorTheme.primary],
    );
  }
}
