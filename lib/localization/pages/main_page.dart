import 'package:CWCFlutter/localization/pages/localization_app_page.dart';
import 'package:CWCFlutter/localization/pages/localization_system_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('Localization', style: style),
          label: 'System',
        ),
        BottomNavigationBarItem(
          icon: Text('Localization', style: style),
          label: 'App',
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return LocalizationSystemPage();
      case 1:
        return LocalizationAppPage();
      default:
        return Container();
    }
  }
}
