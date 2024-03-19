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
          Expanded( // 텍스트가 가능한 모든 공간을 차지하도록 Expanded 사용
            child: AutoSizeText(
              trait,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              minFontSize: 6, // 최소 텍스트 크기를 설정
              maxLines: 1, // 최대 행 수를 1로 설정하여 텍스트가 한 줄을 넘지 않도록 함
              overflow: TextOverflow.ellipsis, // 여전히 넘칠 경우 말줄임표 처리
            ),
          ),
        ],
      ),
    );
  }
}
