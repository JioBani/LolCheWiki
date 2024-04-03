import 'package:app/Model/Champion.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'ChampionListPage.dart';

class ChampionSearchPage extends StatefulWidget {
  const ChampionSearchPage({super.key, required this.championList});

  final List<Champion> championList;

  @override
  State<ChampionSearchPage> createState() => _ChampionSearchPageState();
}

class _ChampionSearchPageState extends State<ChampionSearchPage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                    child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 25.sp,
                        )
                    ),
                  ),
                ),
                Text(
                  '#챔피언 검색',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
              child: TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: '검색하고 싶은 챔피언의 이름을 입력해주세요.',
                  prefixIcon : Icon(
                    Icons.search,
                    size: 30.sp,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Palette.green),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Palette.green),
                  ),
                  // 포커스 되었을 때의 밑줄 색상
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Palette.green),
                  ),
                ),
                onChanged: (value){
                  setState(() {

                  });
                },
              ),
            ),
            Builder(
              builder: (context) {
                if(textEditingController.text == ''){
                  return const SizedBox.shrink();
                }
                else{
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                        child: Wrap(
                          spacing: 5.w,
                          children: widget.championList.where(
                                  (element) => element.name.contains(textEditingController.text)
                          ).map((champion) =>
                              ChampionTileWidget(champion: champion,isExpand: true,)
                          ).toList(),
                        ),
                      ),
                    ),
                  );
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
