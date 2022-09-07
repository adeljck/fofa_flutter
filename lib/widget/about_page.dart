import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  // const AboutPage({Key? key}) : super(key: key);

  var List_View = Column(
    children: [
      Center(
          child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            image: DecorationImage(
              image: new NetworkImage(
                  "https://avatars.githubusercontent.com/u/24542600?s=400&u=b14eb9b133e8eb363f302be2f27245ecc2dbc483&v=4"),
              fit: BoxFit.cover,
            )),
      )),
      Center(
        child: RichText(
          text: new TextSpan(
              text:
                  "Fofa Searcher Develop By Adeljck\nPower By Flutter\nsource_code: ",
              style: TextStyle(color: Colors.black, fontSize: 20),
              children: [
                TextSpan(
                    text: "https://github.com/adeljck/fofa_flutter",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        launchUrlString(
                            "https://github.com/adeljck/fofa_flutter");
                      })
              ]),
        ),
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于FoFa Searcher"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: List_View,
      )),
    );
    // return Center(child: List_View);
  }
}
