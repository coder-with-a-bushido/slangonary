import 'package:flutter/material.dart';
import 'package:urbandictionary/urbandictionary.dart';

class DefPage extends StatelessWidget {
  static String id = 'DefPage';

  @override
  Widget build(BuildContext context) {
    final WordDeftoDefPage args = ModalRoute.of(context).settings.arguments;
    final Definition wordres = args.wordres;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.transparent,
              child: ListView(
                children: [
                  Text(
                    wordres.word,
                  ),
                  //Text(wordres.soundsUrls),
                  Text(wordres.definition),
                  Text(wordres.example),
                  //Text(wordres.author),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class WordDeftoDefPage {
  final Definition wordres;
  WordDeftoDefPage({this.wordres});
}
