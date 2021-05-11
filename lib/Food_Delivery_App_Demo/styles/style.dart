import 'package:CWCFlutter/Food_Delivery_App_Demo/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final double height;

  const PrimaryText({
    this.text,
    this.color: AppColors.secondary,
    this.size: 20,
    this.height: 1.3,
    this.fontWeight: FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: 'Poppins',
        height: height,
      ),
    );
  }
}

TextStyle p8 =
    TextStyle(fontFamily: 'Poppins', fontSize: 8.sp, color: Colors.white);
TextStyle p10 =
    TextStyle(fontFamily: 'Poppins', fontSize: 10.sp, color: Colors.white);
TextStyle p12 =
    TextStyle(fontFamily: 'Poppins', fontSize: 12.sp, color: Colors.white);
TextStyle p13 =
    TextStyle(fontFamily: 'Poppins', fontSize: 13.sp, color: Colors.white);
TextStyle p14 =
    TextStyle(fontFamily: 'Poppins', fontSize: 14.sp, color: Colors.white);
TextStyle p15 =
    TextStyle(fontFamily: 'Poppins', fontSize: 15.sp, color: Colors.white);
TextStyle p16 =
    TextStyle(fontFamily: 'Poppins', fontSize: 16.sp, color: Colors.white);
TextStyle p18 =
    TextStyle(fontFamily: 'Poppins', fontSize: 18.sp, color: Colors.white);
TextStyle p20 =
    TextStyle(fontFamily: 'Poppins', fontSize: 20.sp, color: Colors.white);
TextStyle p24 =
    TextStyle(fontFamily: 'Poppins', fontSize: 24.sp, color: Colors.white);

InputDecoration inputDecoration = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(width: 2.w, color: AppColors.lighterGray),
  ),
  hintStyle: TextStyle(
    color: AppColors.lightGray,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ),
);
