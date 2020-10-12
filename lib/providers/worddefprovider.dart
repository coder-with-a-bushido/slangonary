// import 'package:flutter/rendering.dart';
import 'baseprovider.dart';
import 'package:urbandictionary/urbandictionary.dart';
import 'package:owlbot_dart/owlbot_dart.dart';

class WordDefProvider {
  //@override
  static Future<List<Definition>> wordSlangFetch(String word) async {
    List<Definition> worddef = [];
    final client = UrbanDictionary(client: OfficialUrbanDictionaryClient());
    //print(word);
    if (word == 'slangonary') {
      worddef = await client.random();
      return worddef;
    } else {
      await client.define(word).then((value) {
        worddef = value;
      });
      worddef.sort((a, b) => a.thumbsUp.compareTo(b.thumbsUp));
      return worddef;
    }
  }

  @override
  static Future<List<Definition>> wordDefFetch(String word) async {
    final OwlBot owlBot =
        OwlBot(token: 'd6028da67e4fd2fa6e2f5950eee1b11ca37f48a1');
    final OwlBotResponse res = await owlBot.define(word: "owl");
    print("Pronounciation: ${res.definitions}");
    res.definitions.forEach((def) {
      print(def.definition);
    });
  }
}
