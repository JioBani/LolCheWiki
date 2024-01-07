import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Palette{
  static Color brightGray = Color(0xffF3F3F3);
  static Color brightUi = Color(0xffEAEEF1);
  static Color background = Color(0xffF7F7F9);
  static Color iconColor = const Color(0xffFE5D06);

  static List<Color> rarityColor = [
    Color(0xff7F7F7F),
    Color(0xff13B188),
    Color(0xff237AC3),
    Color(0xffBD44D1),
    Color(0xffBD44D1),
    Color(0xffFABA48),
    Color(0xffFABA48),
    Color(0xffFABA48),
    Color(0xffFABA48),
  ];

  static List<Color> rankColors = [
    Color(0xff6f6f6f),
    Color(0xffEB7100),
    Color(0xff13B188),
    Color(0xff237AC3),
    Color(0xff237AC3),
    Color(0xff6f6f6f),
    Color(0xff6f6f6f),
    Color(0xff6f6f6f),
    Color(0xff6f6f6f),
    Color(0xff6f6f6f),
  ];
}

class ShadowPalette{
  static BoxShadow defaultShadow = BoxShadow(
    offset: Offset(0,4.sp),
    blurRadius: 4.sp,
    color: Colors.black.withOpacity(0.15)
  );
}