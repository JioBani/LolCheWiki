import 'package:app/Model/RiotApi/SummonerProfile.dart';
import 'package:app/Service/Riot/RiotApiResponse.dart';
import 'package:app/Service/Riot/RiotApiService.dart';
import 'package:app/Style/Palette.dart';
import 'package:app/View/MatchHistory/MatchHistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () async{

              String value = _searchController.text;
              int hashIndex = value.indexOf('#');

              String name;
              String tag;

              if (hashIndex != -1) {
                name = value.substring(0, hashIndex);
                tag = value.substring(hashIndex + 1);
              } else {
                name = value;
                tag = "KR1";
              }

              RiotApiResponse<SummonerProfile> apiResponse = await RiotApiService.getSummonerProfileByName(name, tag);

              if(apiResponse.isSuccess){
                Get.to(MatchHistoryPage(summonerProfile: apiResponse.response!));
              }
              else{
                Fluttertoast.showToast(msg: apiResponse.exception!.msg);
              }
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
