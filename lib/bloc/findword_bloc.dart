import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slanganory/repository/worddefrepository.dart';
import 'package:urbandictionary/urbandictionary.dart';

part 'findword_event.dart';
part 'findword_state.dart';

class FindwordBloc extends Bloc<FindwordEvent, FindwordState> {
  FindwordBloc() : super(FindwordInitial());

  @override
  Stream<FindwordState> mapEventToState(
    FindwordEvent event,
  ) async* {
    if (event is SearchShown) {
      yield FindwordInitial();
    } else {
      if (event is SearchWord) {
        if (event.word.length >= 1) {
          try {
            print(event.word);
            yield FindWordFound(word: event.word, choice: event.choice);
          } catch (e) {
            yield FindWordNotFound();
          }
        } else {
          yield FindwordInitial();
        }
      }
    }
  }
}
