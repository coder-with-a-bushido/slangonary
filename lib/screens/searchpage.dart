import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slanganory/Items/deftile.dart';
import 'package:slanganory/bloc/findword_bloc.dart';
import 'package:action_process_text/action_process_text.dart';

class SearchPage extends StatefulWidget {
  static String id = 'SearchPage';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController inputtext = TextEditingController(text: '');
  _SearchPageState() {
    initActionProcessText();
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: inputtext,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'What do you wanna know?',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                onChanged: (value) => BlocProvider.of<FindwordBloc>(context)
                    .add(SearchWord(word: value ?? 'slangonary', choice: 1)),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.transparent,
                child: BlocBuilder<FindwordBloc, FindwordState>(
                    builder: (BuildContext context, FindwordState state) {
                  if (state is FindwordInitial) {
                    return Container();
                  }
                  if (state is FindWordFound) {
                    return FutureBuilder(
                        future: state.wordDef(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.active:
                              return Container();
                            case ConnectionState.waiting:
                              return Container();
                            case ConnectionState.none:
                              return Container();
                            case ConnectionState.done:
                              return Container(
                                child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return DefTile(
                                        // index: index,
                                        // snapshot: snapshot,
                                        data: snapshot.data[index],
                                      );
                                    }),
                              );
                            default:
                              return Container();
                          }
                        });
                  }
                  if (state is FindWordNotFound) {
                    return Text('Error');
                  }

                  return Container();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
