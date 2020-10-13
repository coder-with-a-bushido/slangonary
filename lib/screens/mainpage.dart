import 'package:flutter/material.dart';
import 'package:slanganory/Items/displaydef.dart';
import 'package:slanganory/Items/paperdetails.dart';
import 'package:slanganory/Items/searchpage.dart';

TextEditingController searchtext = TextEditingController(text: '');

class MainPage extends StatelessWidget {
  static String id = 'MainPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4E3CB),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              PaperDetails(),
              SliverSearchBar(),
              DisplayDef(),
            ],
          ),
        ));
  }
}
