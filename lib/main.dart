import 'dart:io';
import 'package:exploitman/conf/config.dart';
import 'package:exploitman/widget/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants/constants.dart';
import 'widget/info_page.dart';
import "conf/init.dart";

var fofa = FoFaApi();
void main(List<String> args) {
  debugPaintSizeEnabled = !true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FoFaSearcher());
}

class FoFaSearcher extends StatefulWidget {
  const FoFaSearcher({Key? key}) : super(key: key);

  @override
  State<FoFaSearcher> createState() => _FoFaSearcherState();
}

class _FoFaSearcherState extends State<FoFaSearcher> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "FoFa Searcher",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(primaryColor: Colors.black, fontFamily: "PingFang"));
  }
}
