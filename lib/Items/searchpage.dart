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
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Column(
        children: [
          ClipRRect(
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
          SizedBox(
            height: 10,
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 6),
          child: ClipOval(
            child: Material(
              color: Color(0xFFCE8151), // button color
              child: Column(
                children: [
                  InkWell(
                    splashColor: Color(0xFFB95334), // inkwell color
                    child: SizedBox(
                        width: 46, height: 46, child: Icon(Icons.search)),
                    onTap: () => BlocProvider.of<FindwordBloc>(context).add(
                        SearchWord(
                            word: inputtext.text ?? 'slangonary', choice: 1)),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // )
                ],
              ),
            ),
          ),
        ),
      ],
      floating: true,
      snap: true,
      elevation: 0.0,
    );
  }
}
