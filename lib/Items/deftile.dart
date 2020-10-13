import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stopper/stopper.dart';

class DefTile extends StatelessWidget {
  const DefTile({this.data});
  // final AsyncSnapshot<dynamic> snapshot;
  // final int index;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      title: Text(data.word),
      subtitle: Text(data.definition),
      enabled: true,
      contentPadding: EdgeInsets.all(10),
      onTap: () {
        showStopper(
            context: context,
            builder: (context, scrollController, scrollPhysics, stop) {
              return SafeArea(
                child: Container(
                  color: Color(0xFFECDDCA),
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Color(0xFFECDDCA),
                        leading: Icon(Icons.arrow_back_ios),
                        title: Text(
                          data.word,
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          //Text(wordres.soundsUrls),
                          Text(data.definition),
                          Text(data.example),
                          //Text(wordres.author),
                        ]),
                      )
                    ],
                    controller: scrollController,
                    physics: scrollPhysics,
                  ),
                ),
              );
            },
            stops: [0.5 * height, height]);
        // Navigator.pushNamed(context, DefPage.id,
        //     arguments: WordDeftoDefPage(wordres: data));
      },
    );
  }
}
