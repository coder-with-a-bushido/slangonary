import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stopper/stopper.dart';

class DefTile extends StatelessWidget {
  const DefTile({this.data, this.tilecolor, this.textcolor});
  // final AsyncSnapshot<dynamic> snapshot;
  // final int index;
  final dynamic data;
  final Color tilecolor;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: ListTile(
            tileColor: tilecolor,
            title: Text(
              data.word,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              data.definition,
              style: TextStyle(color: textcolor),
            ),
            enabled: true,
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              showStopper(
                  context: context,
                  builder: (context, scrollController, scrollPhysics, stop) {
                    return SafeArea(
                      child: Container(
                        color: Color(0xFFD5C4B0),
                        //padding: EdgeInsets.all(10),
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage("images/bg.jpg"),
                        //         fit: BoxFit.cover)),
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              automaticallyImplyLeading: false,
                              backgroundColor: tilecolor,
                              title: Text(
                                data.word,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      textDirection: TextDirection.ltr,
                                      children: [
                                        Text("\n"),
                                        Text(
                                          "Definition:\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(data.definition + "\n"),
                                        Text(
                                          "Example:\n",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(data.example),
                                      ],
                                    ),
                                  ),
                                  //Text(wordres.author),
                                ],
                              ),
                            ),
                            // }),
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
          ),
        ),
      ),
    );
  }
}
