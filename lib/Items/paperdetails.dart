import 'package:flutter/material.dart';

class PaperDetails extends StatelessWidget {
  const PaperDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Text(
          "edition 0.1.1",
          textAlign: TextAlign.right,
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          "Slangonary",
          style: TextStyle(
            fontSize: 50,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("VOL I", textAlign: TextAlign.left),
              Text(
                "The Pulchritudinous Terra,",
                textAlign: TextAlign.right,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("NO I", textAlign: TextAlign.left),
              Text(
                "MONDAY, SEP 28, 2020",
                textAlign: TextAlign.right,
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              color: Color(0xFFECDDCA),
              child: Text(
                  "❝ Detachment is not that you own nothing, but that nothing owns you ❞"),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
