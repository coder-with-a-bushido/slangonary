part of 'findword_bloc.dart';

@immutable
abstract class FindwordEvent {}

class SearchShown extends FindwordEvent {}

class SearchWord extends FindwordEvent {
  SearchWord({this.word, this.choice});
  final String word;
  final int choice;
}
