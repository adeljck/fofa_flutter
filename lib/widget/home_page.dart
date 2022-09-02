import 'package:exploitman/widget/search_page.dart';
import 'package:exploitman/widget/seting_page.dart';
import 'package:exploitman/widget/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:exploitman/widget/about_page.dart";

class NavigationIconView {
  //item
  final BottomNavigationBarItem item;
  //title
  final String title;
  //icon path
  final String iconPath;
  //active Icon Path
  final String activeIconPath;
  NavigationIconView(
      {required this.title,
      required this.iconPath,
      required this.activeIconPath})
      : item = BottomNavigationBarItem(
            icon: Image.asset(
              iconPath,
              width: 20.0,
              height: 20.0,
            ),
            activeIcon: Image.asset(
              activeIconPath,
              width: 20,
              height: 20,
            ),
            label: title);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appBarTitle = ["我的", "搜索", "设置", "关于"];
  int _currentIndex = 1;
  final _widgetOptions = [
    UserPage(),
    SearchPage(),
    SettingPage(),
    AboutPage(),
  ];
  late List<BottomNavigationBarItem> BarItems;
  @override
  void initState() {
    super.initState();
    BarItems = [
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: _appBarTitle[0]),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: _appBarTitle[1]),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: _appBarTitle[2]),
      BottomNavigationBarItem(icon: Icon(Icons.info), label: _appBarTitle[3])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: BarItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 30,
      ),
    );
  }
}
