import 'package:app/Controller/ItemPageController.dart';
import 'package:app/Model/Item.dart';
import 'package:app/View/ItemInfo/ItemCombinationTableWidget.dart';
import 'package:app/View/ItemInfo/itemSearchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemInfoPage extends StatelessWidget {
  const ItemInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemPageController());

    var controller = Get.find<ItemPageController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.w,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
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
                Text(
                  '#아이템 목록',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5.w, 0),
                  child: IconButton(
                      onPressed: (){
                        Get.to(ItemSearchPage());
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.search,
                        size: 30.sp,
                      )
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: FutureBuilder(
                future: controller.fetchData(),
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Center(
                      child: Text('데이터를 가져 올 수 없습니다. ${snapshot.error}'),
                    );
                  }
                  else if(!snapshot.hasData){
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  else{
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: SizedBox(
                            width : 340.w,
                            height : 340.w,
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 10 , crossAxisSpacing: 2.w , mainAxisSpacing: 2.w),
                                itemCount: 100,
                                physics : const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if(index == 0){
                                    return ItemBoxWidget(index : 0, item: Item.error(), itemType: null,);
                                  }
                                  else if(index <= 9){
                                    return ItemBoxWidget(index : index, item: controller.componentItemList[index - 1], itemType: ItemType.component,);
                                  }
                                  else if(index % 10 == 0){
                                    return ItemBoxWidget(index : index ~/ 10, item: controller.componentItemList[index ~/ 10 - 1], itemType: ItemType.component,);
                                  }
                                  else{
                                    return ItemBoxWidget(index : index, item: controller.findCombinationItemByGridIndex(index), itemType: ItemType.completed,);
                                  }
                                }
                            ),
                          ),
                        ),
                        SizedBox(height: 15.w,),
                        const ItemCombinationTableWidget(),
                      ],
                    );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemBoxWidget extends StatelessWidget {
  const ItemBoxWidget({super.key, required this.item, required this.itemType, required this.index});
  final Item item;
  final ItemType? itemType;
  final int index;

  @override
  Widget build(BuildContext context) {
    ItemPageController controller = Get.find<ItemPageController>();
    if(itemType == null){
      return Container(
        color: Colors.white,
      );
    }
    else{
      return InkWell(
        onTap: (){
          controller.onTapItem(item);
        },
        child: Container(
          color: item.isError ? Colors.redAccent :  Colors.blueAccent,
          child: Image.asset(
            'assets/images/item/${item.getImageString()}',
            errorBuilder: (context, e,stackTrace){
              return const SizedBox();
            },
          ),
        ),
      );
    }
  }
}