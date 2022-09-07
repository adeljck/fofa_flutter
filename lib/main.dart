import 'dart:io';
import 'package:exploitman/conf/config.dart';
import 'package:exploitman/widget/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "conf/init.dart";
import 'package:desktop_window/desktop_window.dart';

var fofa = FoFaApi();
void main(List<String> args) {
  debugPaintSizeEnabled = !true;
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
     DesktopWindow.setWindowSize(Size(1086, 827));
  }
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
