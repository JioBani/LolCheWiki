import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchHistoryWidget extends StatelessWidget {
  const SearchHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260.w,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchTextWidget(text: "보타쿠리ddddddddddddddddddddddddd",),
          SizedBox(width: 30.h,),
          SearchTextWidget(text: "보타ddddddddddddddddd",),
          SizedBox(width: 30.h,),
          SearchTextWidget(text: "보타리dddddddddddddddd",isFinal: true,),
        ],
      ),
    );
  }
}

class SearchTextWidget extends StatelessWidget {
  const SearchTextWidget({super.key, required this.text, this.isFinal = false});

  final String text;
  final bool isFinal;

  @override
  Widget build(BuildContext context) {
    /*return Container(
      constraints: BoxConstraints(minWidth: 0, maxWidth: 260.w/3),
      child: DefaultTextStyle(
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: Colors.black
        ),
        child: Wrap(
          alignment : WrapAlignment.end,
          children: [
            Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(width: 10.h,),
            Text("X"),
            SizedBox(width: isFinal ? 0 : 30.h,),
          ],
        ),
      ),
    );*/
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 250.w / 3 - 40),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 10.h,),
        Text("X"),
      ],
    );
  }
}

