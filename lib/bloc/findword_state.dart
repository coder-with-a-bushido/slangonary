part of 'findword_bloc.dart';

@immutable
abstract class FindwordState {
  wordDef() {}
}

class FindwordInitial extends FindwordState {
  final worddefrepo = WordDefRepository();
  Future<List<Definition>> wordDef() async {
    print('random called');
    List<Definition> def = await worddefrepo.wordSlangFetch('slangonary');
    return def;
  }
}

class FindWordFound extends FindwordState {
  FindWordFound({this.word, this.choice});
  final String word;
  final int choice;
  final worddefrepo = WordDefRepository();
  Future<List<Definition>> wordDef() async {
    print(this.word);
    List<Definition> def = await worddefrepo.wordSlangFetch(this.word);
    return def;
  }
}

class FindWordNotFound extends FindwordState {}
