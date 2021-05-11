import 'package:CWCFlutter/screens/home.dart';
import 'package:CWCFlutter/screens/home_page/widget_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            showButton(
                context, 'Food_Delivery_Demo', Colors.yellow, Colors.black, 3),
            showButton(context, 'Provider', Colors.green, Colors.white, 1),
            showButton(context, 'Preferences', Colors.red, Colors.white, 2),
            showButton(context, 'Preferences', Colors.purple, Colors.white, 4),

            // showButtonYoutube(),
          ],
        ),
      ),
    );
  }
}
