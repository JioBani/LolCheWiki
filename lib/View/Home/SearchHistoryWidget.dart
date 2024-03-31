import 'package:app/Controller/HomePageController.dart';
import 'package:app/Controller/SearchHistoryController.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchHistoryWidget extends StatefulWidget {
  const SearchHistoryWidget({super.key});

  @override
  State<SearchHistoryWidget> createState() => _SearchHistoryWidgetState();
}

class _SearchHistoryWidgetState extends State<SearchHistoryWidget> {

  final autoSizeGroup = AutoSizeGroup();

  @override
  void initState() {
    Get.find<SearchHistoryController>().getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<SearchHistoryController>(
      builder: (controller) {
        return SizedBox(
          width: 260.w,
          height: 30.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
              children : List.generate(
                  controller.searchHistory.value.length,
                  (index) => SearchTextWidget(
                      text: controller.searchHistory.value[index] ,
                      index: index,
                      isFinal : controller.searchHistory.value.length - 1 == index,
                      autoSizeGroup: autoSizeGroup,
                  )
              )
          )
        );
      }
    );
  }
}

class SearchTextWidget extends StatelessWidget {
  SearchTextWidget({
    super.key,
    required this.text,
    this.isFinal = false,
    required this.index,
    required this.autoSizeGroup,
  });

  final String text;
  final bool isFinal;
  final int index;
  final AutoSizeGroup autoSizeGroup;

  final homePageController = HomePageController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchHistoryController>();
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: controller.searchHistory.isNotEmpty ? 260.w / controller.searchHistory.length : 260,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: InkWell(
              onTap: (){
                homePageController.searchByName(text, context);
              },
              child: AutoSizeText(
                text,
                group: autoSizeGroup,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15),
                maxFontSize: 15,// 기본 크기 설정
                minFontSize: 13, // 최소 크기 설정
                maxLines: 1,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {
              controller.removeSearchHistory(index);
            },
            child: const Text("X"),
          ),
          SizedBox(width: isFinal ? 0 : 10.w),
        ],
      ),
    );
  }
}


