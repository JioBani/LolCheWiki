import 'package:app/View/MatchHistory/Match/OpenIconWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollTest extends StatefulWidget {
  @override
  _ScrollTestState createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          OpenIconWidget(
            duration: const Duration(milliseconds: 500),
            onOpenAction: (){
              setState(() {
                isOpen = !isOpen;
              });
            },
            onClosedAction: (){
              setState(() {
                isOpen = !isOpen;
              });
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(right: 10.w , bottom: 24.h),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(5.sp) , bottomRight: Radius.circular(5.sp)),
        ),
        child: AnimatedSize(
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 5.h),
            child: Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(
                      builder: (context){
                        if(!isOpen){
                          return SizedBox();
                        }
                        else{
                          return Column(
                            children: [
                              Text("gd"),
                              Text("gd"),
                              Text("gd"),
                              Text("gd"),
                              Text("gd"),
                            ],
                          );
                        }
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}