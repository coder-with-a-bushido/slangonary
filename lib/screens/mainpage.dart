import 'package:flutter/material.dart';
import 'package:slanganory/Items/displaydef.dart';
import 'package:slanganory/Items/paperdetails.dart';
import 'package:slanganory/Items/searchpage.dart';

class MainPage extends StatelessWidget {
  static String id = 'MainPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "images/bg.jpg",
            fit: BoxFit.cover,
          ),
          CustomScrollView(
            slivers: <Widget>[
              PaperDetails(),
              SliverSearchBar(),
              DisplayDef(),
            ],
          ),
        ],
      ),
    ));
  }
}
