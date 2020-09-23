import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slanganory/bloc/findword_bloc.dart';
import 'defpage.dart';
import 'package:flutter/services.dart';
import 'package:urbandictionary/urbandictionary.dart';

class SearchPage extends StatelessWidget {
  TextEditingController inputtext = TextEditingController();
  static String id = 'SearchPage';
  static const platform = const MethodChannel('com.flutter.textselectaction');
  SearchPage() {
    platform.setMethodCallHandler(_handleMethod);
  }
  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case "copiedText":
        //print(call.arguments);
        inputtext.text = call.arguments.toString();
        return call.arguments;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(inputtext.text);
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
                    .add(SearchWord(word: value, choice: 1)),
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
                                      return ListTile(
                                        title: Text(snapshot.data[index].word),
                                        subtitle: Text(
                                            snapshot.data[index].definition),
                                        enabled: true,
                                        contentPadding: EdgeInsets.all(10),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, DefPage.id,
                                              arguments: WordDeftoDefPage(
                                                  wordres:
                                                      snapshot.data[index]));
                                        },
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
