import 'package:app/Controller/MatchHistoryController.dart';
import 'package:app/View/MatchHistory/MatchCategoryTabView/MatchCategoryTabViewWidget.dart';
import 'package:app/View/MatchHistory/ProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MatchHistoryPage extends StatelessWidget {
  MatchHistoryPage({super.key});

  final MatchHistoryController controller = Get.put(MatchHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              SizedBox(height: 13.h,),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 28.sp,
                      ),
                  ),
                ),
              ),
              SizedBox(height: 13.h,),
              ProfileWidget(),
              SizedBox(height: 24.h,),
              MatchCategoryTabViewWidget()
            ],
          ),
        ),
      ),
    );
  }
}
