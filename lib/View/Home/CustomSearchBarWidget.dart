import 'package:app/Controller/HomePageController.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  HomePageController homePageController = HomePageController();

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Padding(
      padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0),
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: '검색할 유저의 닉네임을 입력하세요',
          filled: true,
          fillColor: Palette.brightUi,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Palette.green,
            ),
            onPressed: (){
              homePageController.searchByName(searchController.text, context);
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
