import 'package:CWCFlutter/Food_Delivery_App_Demo/screens/home_food.dart';
import 'package:CWCFlutter/localization/pages/main_page.dart';
import 'package:CWCFlutter/screens/home.dart';
import 'package:CWCFlutter/screens/shared_prefer/shared_login.dart';

import 'package:flutter/material.dart';

Widget display(BuildContext context, String text, Color color1, Color color2,
    int pageIndex) {
  return ButtonTheme(
    minWidth: 240.0,
    height: 44.0,
    child: ElevatedButton(
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color1,
        onPrimary: color2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      onPressed: () {
        var page;
        switch (pageIndex) {
          case 1:
            page = Home();
            break;
          case 2:
            page = Login();
            break;
          case 3:
            page = HomeFood();
            break;
          case 4:
            page = MainPage();
            break;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ),
        );
      },
    ),
  );
}

Widget showButton(BuildContext context, String text, Color color1, Color color2,
    int pageIndex) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(),
      SizedBox(
        width: 2.0,
      ),
      display(context, text, color1, color2, pageIndex),
    ],
  );
}
