import 'package:app/Controller/ItemPageController.dart';
import 'package:app/Model/Item.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemCombinationTableWidget extends StatefulWidget {
  const ItemCombinationTableWidget({super.key});

  @override
  State<ItemCombinationTableWidget> createState() => _ItemCombinationTableWidgetState();
}

class _ItemCombinationTableWidgetState extends State<ItemCombinationTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TableItemWidget(index:0),
              Icon(
                Icons.add,
                color: Colors.grey,
                size: 25.sp,
                weight: 700,
              ),
              const TableItemWidget(index:1),
              Image.asset(
                Images.icons.equals,
                color: Colors.grey,
                width: 25.sp,
                height: 25.sp,
              ),
              const TableItemWidget(index:2),
            ],
          ),
        ),
        SizedBox(height: 15.w,),
        Container(
          width: double.infinity,
          height: 250.h,
          margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
          padding: EdgeInsets.fromLTRB(15.w, 15.w, 15.w, 0),
          decoration: BoxDecoration(
              color: Palette.brightUi,
              borderRadius: BorderRadius.circular(10.r)
          ),
          child: GetX<ItemPageController>(
            builder: (controller) {
              Item? targetItem;

              for (var item in controller.items) {
                if(item != null) targetItem = item;
              }
              
              if(targetItem == null){
                return const SizedBox();
              }
              else{
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment : Alignment.center,
                      child: Text(
                        '#${targetItem.name}' ?? '',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Palette.green
                        ),
                      ),
                    ),
                    SizedBox(height: 8.w,),
                    Text(
                      targetItem.resolvedDesc() ?? '',
                      style: TextStyle(
                          fontSize: 14.sp,
                      ),
                    ),
                  ],
                );
              }
            }
          ),
        )
      ],
    );
  }
}

class TableItemWidget extends StatelessWidget {
  const TableItemWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var controller =  Get.find<ItemPageController>();
    return InkWell(
      onTap: (){
        controller.onTabTableItem(index);
      },
      child: SizedBox(
        width: 50.w,
        height: 50.w,
        child: GetX<ItemPageController>(
            builder: (controller) {
              if(controller.items[index] != null){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.asset('assets/images/item/${controller.items[index]!.getImageString()}'),
                );
              }
              else{
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Palette.brightUi
                  ),
                );
              }
            }
        ),
      ),
    );
  }
}

