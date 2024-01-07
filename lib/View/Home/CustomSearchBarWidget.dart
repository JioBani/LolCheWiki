import 'package:app/Style/Palette.dart';
import 'package:app/View/MatchHistory/MatchHistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0),
      child: TextFormField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: '검색할 유저의 닉네임을 입력하세요',
          filled: true,
          fillColor: Palette.brightUi,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () {
              Get.to(MatchHistoryPage());
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.fromLTRB(10.w, 5.h, 0, 5.h)
        ),
      ),
    );
  }
}
