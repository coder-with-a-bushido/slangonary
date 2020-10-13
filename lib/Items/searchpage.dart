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
      backgroundColor: Colors.transparent,
      title: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: TextField(
            controller: inputtext,
            decoration: InputDecoration(
              hintText: 'What do you wanna know?',
            ),
            onChanged: (value) => BlocProvider.of<FindwordBloc>(context)
                .add(SearchWord(word: value ?? 'slangonary', choice: 1)),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => BlocProvider.of<FindwordBloc>(context)
              .add(SearchWord(word: inputtext.text ?? 'slangonary', choice: 1)),
        )
      ],
      floating: true,
      snap: true,
      elevation: 0.0,
    );
  }
}
