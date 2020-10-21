import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slanganory/bloc/findword_bloc.dart';

import 'deftile.dart';

class DisplayDef extends StatelessWidget {
  const DisplayDef({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindwordBloc, FindwordState>(
        builder: (BuildContext context, FindwordState state) {
      // if (state is FindwordInitial) {
      //   return SliverList(delegate: SliverChildListDelegate([Container()]));
      // }
      if (state is FindWordFound || state is FindwordInitial) {
        return FutureBuilder(
            future: state.wordDef(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return SliverList(
                      delegate: SliverChildListDelegate([Container()]));
                case ConnectionState.waiting:
                  return SliverList(
                      delegate: SliverChildListDelegate([Container()]));
                case ConnectionState.none:
                  return SliverList(
                      delegate: SliverChildListDelegate([Container()]));
                case ConnectionState.done:
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext ctxt, int index) {
                        return Column(
                          children: [
                            DefTile(
                              // index: index,
                              // snapshot: snapshot,
                              data: snapshot.data[index],
                              tilecolor: index % 2 == 0
                                  ? Color(0xFFB95334)
                                  : Color(0xFFCE8151),
                              textcolor: index % 2 == 0
                                  ? Colors.black87
                                  : Colors.black54,
                            ),
                            SizedBox(height: 10)
                          ],
                        );
                      },
                      childCount: snapshot.data.length,
                    ),
                  );
                default:
                  return SliverList(
                      delegate: SliverChildListDelegate([Container()]));
              }
            });
      }
      if (state is FindWordNotFound) {
        return Text('Error');
      }

      return Container();
    });
  }
}
