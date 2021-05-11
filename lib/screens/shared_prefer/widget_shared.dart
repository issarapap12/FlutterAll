import 'package:flutter/material.dart';

Widget displayS(
  BuildContext context,
  String text,
  Color color1,
  Color color2,
) {
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
      onPressed: () {},
    ),
  );
}

Widget showButtonShared(
  BuildContext context,
  String text,
  Color color1,
  Color color2,
) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(),
      SizedBox(
        width: 2.0,
      ),
      displayS(
        context,
        text,
        color1,
        color2,
      ),
    ],
  );
}
