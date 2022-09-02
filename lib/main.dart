import 'dart:io';
import 'package:exploitman/widget/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants/constants.dart';
import 'widget/info_page.dart';
import "conf/init.dart";

void main(List<String> args) {
  debugPaintSizeEnabled = !true;
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(FoFaSearcher());
}

class FoFaSearcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "FoFa Searcher",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(primaryColor: Colors.black, fontFamily: "PingFang"));
  }
}
