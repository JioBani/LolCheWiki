import 'package:app/Style/Images.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TraitTextWidget extends StatelessWidget {
  const TraitTextWidget({super.key, required this.trait});
  final String trait;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 1.5.h , bottom: 1.5.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Images.traitDefaultImage,
            width: 15.sp,
            height: 15.sp,
            color: Colors.black,
          ),
          Expanded(
            child: AutoSizeText(
              trait,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              minFontSize: 6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
