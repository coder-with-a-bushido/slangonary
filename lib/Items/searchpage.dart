import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slanganory/bloc/findword_bloc.dart';
import 'package:action_process_text/action_process_text.dart';

class SliverSearchBar extends StatefulWidget {
  static String id = 'SliverSearchBar';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SliverSearchBar> {
  TextEditingController inputtext = TextEditingController(text: '');
  _SearchPageState() {
    initActionProcessText();
    //inputtext.text = searchtext;
  }

  Future<void> initActionProcessText() async {
    inputtext.text = await ActionProcessText.getInputText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print(inputtext.text);
    BlocProvider.of<FindwordBloc>(context)
        .add(SearchWord(word: inputtext.text, choice: 1));
    return SliverAppBar(
      title: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(20),
        child: TextField(
          controller: inputtext,
          decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: 'What do you wanna know?',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          onChanged: (value) => BlocProvider.of<FindwordBloc>(context)
              .add(SearchWord(word: value ?? 'slangonary', choice: 1)),
        ),
      ),
    );
  }
}
