import 'package:slanganory/providers/baseprovider.dart';
import 'package:slanganory/providers/worddefprovider.dart';
import 'package:urbandictionary/urbandictionary.dart';

class WordDefRepository {
  Future<List<Definition>> wordSlangFetch(String wordword) async =>
      WordDefProvider.wordSlangFetch(wordword);
}
