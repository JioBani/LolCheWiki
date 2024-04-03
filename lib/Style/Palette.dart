import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Palette{
  static Color brightGray = const Color(0xffF3F3F3);
  static Color darkGray = const Color(0xff939393);
  static Color brightUi = const Color(0xffEAEEF1);
  static Color background = const Color(0xffF7F7F9);
  static Color iconColor = const Color(0xffFE5D06);

  static List<Color> rarityColor = [
    const Color(0xff7F7F7F),
    const Color(0xff7F7F7F),
    const Color(0xff13B188),
    const Color(0xff237AC3),
    const Color(0xffBD44D1),
    const Color(0xffFABA48),
    const Color(0xffFABA48),
    const Color(0xfffa4848),
    const Color(0xfffa4848),
    const Color(0xfffa4848),
    const Color(0xfffa4848),
    const Color(0xfffa4848),
    const Color(0xfffa4848),
  ];

  static List<Color> rankColors = [
    const Color(0xff6f6f6f),
    const Color(0xffEB7100),
    const Color(0xff13B188),
    const Color(0xff237AC3),
    const Color(0xff237AC3),
    const Color(0xff6f6f6f),
    const Color(0xff6f6f6f),
    const Color(0xff6f6f6f),
    const Color(0xff6f6f6f),
    const Color(0xff6f6f6f),
  ];
  
  static Color green = const Color.fromRGBO(51, 206, 140, 1);
  static Color greenDark = const Color.fromRGBO(12, 47, 28, 1.0);
  static Color unSelectedGrey = const Color.fromRGBO(239, 239, 239, 1.0);
}

class ShadowPalette{
  static BoxShadow defaultShadow = BoxShadow(
    offset: Offset(0,4.sp),
    blurRadius: 4.sp,
    color: Colors.black.withOpacity(0.15)
  );
}