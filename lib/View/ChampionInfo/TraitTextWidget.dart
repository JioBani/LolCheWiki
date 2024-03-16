import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TraitTextWidget extends StatelessWidget {
  const TraitTextWidget({super.key, required this.trait});
  final String trait;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 1.5.h , bottom: 1.5.h),
      child: Text(
        trait,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
