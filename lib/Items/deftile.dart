import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slanganory/screens/defpage.dart';

class DefTile extends StatelessWidget {
  const DefTile({this.data});
  // final AsyncSnapshot<dynamic> snapshot;
  // final int index;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.word),
      subtitle: Text(data.definition),
      enabled: true,
      contentPadding: EdgeInsets.all(10),
      onTap: () {
        Navigator.pushNamed(context, DefPage.id,
            arguments: WordDeftoDefPage(wordres: data));
      },
    );
  }
}
