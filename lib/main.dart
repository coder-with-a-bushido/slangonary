import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/findword_bloc.dart';
import 'screens/mainpage.dart';
import 'package:flutter/services.dart';
import 'Items/searchpage.dart';
import 'providers/worddefprovider.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => FindwordBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            Colors.orange, // scaffoldBackgroundColor: Color(0xFFF4E3CB),
      ),
      home: MainPage(),
      // routes: {
      //   MainPage.id: (context) => MainPage(),
      //   SearchPage.id: (context) => SearchPage(),
      //   DefPage.id: (context) => DefPage()
      // },
    );
  }
}
