import 'package:app/Style/Palette.dart';
import 'package:app/View/BottomNavBar/BottomNavBar.dart';
import 'package:app/View/Home/CustomSearchBarWidget.dart';
import 'package:app/View/Home/ProfileWidget.dart';
import 'package:app/View/Home/SearchHistoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 113.h),
            CustomSearchBar(),
            SizedBox(height: 10.h),
            SearchHistoryWidget(),
            SizedBox(height: 25.h),
            ProfileWidget()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
