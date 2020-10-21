import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/quotes.dart';

class PaperDetails extends StatelessWidget {
  const PaperDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String quotetext = Quotes.getRandom().content;
    String openquotesymbol = "❝";
    String endquotesymbol = "❞";
    //var now = new DateTime.now();
    //var nowparse = DateTime.parse(now);
    return SliverList(
      delegate: SliverChildListDelegate([
        // Text(
        //   "edition 0.1.1",
        //   textAlign: TextAlign.right,
        //   style: GoogleFonts.raleway(),
        // ),
        // SizedBox(
        //   height: 6,
        // ),
        // Text(
        //   "Slangonary",
        //   style: GoogleFonts.monoton(
        //     fontSize: 40,
        //     //fontWeight: FontWeight.bold,
        //     color: Color(0xFF4A4A4A),
        //   ),
        //   textAlign: TextAlign.center,
        // ),
        // SizedBox(
        //   height: 30,
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text("VOL I", textAlign: TextAlign.left),
        //       Text(
        //         "The Pulchritudinous Terra,",
        //         textAlign: TextAlign.right,
        //       )
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text("NO I", textAlign: TextAlign.left),
        //       Text(
        //         "${now.day}, ${now.month} ${now.}, 2020",
        //         textAlign: TextAlign.right,
        //       )
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              //color: Color(0xFFECDDCA),
              child: RichText(
                text: TextSpan(
                    text: "$openquotesymbol",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: "$quotetext",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      TextSpan(
                        text: "$endquotesymbol",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ]),
                textAlign: TextAlign.center,
              ),
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
