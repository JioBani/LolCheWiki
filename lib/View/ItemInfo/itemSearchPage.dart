import 'package:app/Controller/ItemPageController.dart';
import 'package:app/Model/Item.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemSearchPage extends StatefulWidget {
  const ItemSearchPage({super.key});

  @override
  State<ItemSearchPage> createState() => _ItemSearchPageState();
}

class _ItemSearchPageState extends State<ItemSearchPage> {
  final TextEditingController textEditingController = TextEditingController();

  List<Item>? itemList;

  @override
  Widget build(BuildContext context) {
    ItemPageController controller = Get.find<ItemPageController>();

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.fetchData(),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return const Center(
                child: Text('데이터를 가져 올 수 없습니다.'),
              );
            }
            else if(!snapshot.hasData){
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            else{
              if(itemList == null){
                itemList = [];
                itemList!.addAll(controller.completeItemList);
                itemList!.addAll(controller.componentItemList);
              }

              return Column(
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
                        '#아이템 검색',
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
                        hintText: '검색하고 싶은 아이템의 이름을 입력해주세요.',
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
                                  children: itemList!.where(
                                          (element) => element.name?.contains(textEditingController.text) ?? false
                                  ).map((item) =>
                                      ItemListTileWidget(item: item, controller: controller,)
                                  ).toList(),
                                ),
                              ),
                            ),
                          );
                        }
                      }
                  )
                ],
              );
            }
          }
        ),
      ),
    );
  }
}

class ItemListTileWidget extends StatelessWidget {
  const ItemListTileWidget({super.key, required this.item ,required this.controller});
  final Item item;
  final ItemPageController controller;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 10.w),
      height: 200.w,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Palette.brightUi,
      ),
      padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: 50.w,
                height: 50.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.asset(
                    Images.getItemImagePath(item.apiName),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10.w,),
              Builder(
                builder:(context){
                  if(item.composition.length == 2){
                    Item? item0 = controller.findItemByApiName(item.composition[0]);
                    Item? item1 = controller.findItemByApiName(item.composition[1]);

                    if(item0 == null || item1 == null){
                      return const SizedBox();
                    }
                    else{
                      return Row(
                        children: [
                          SizedBox(
                            width: 17.sp,
                            height: 17.sp,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2.r),
                              child: Image.asset(
                                Images.getItemImagePath(item0.apiName),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.add,
                            size: 15.sp,
                          ),
                          SizedBox(
                            width: 17.sp,
                            height: 17.sp,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2.r),
                              child: Image.asset(
                                Images.getItemImagePath(item1.apiName),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }
                  else{
                    return const SizedBox();
                  }
                }
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      item.name ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      item.resolvedDesc(),
                      minFontSize: 11,
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

