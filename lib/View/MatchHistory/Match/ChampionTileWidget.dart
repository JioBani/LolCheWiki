import 'package:app/Model/RiotApi/UnitDto.dart';
import 'package:app/Style/Images.dart';
import 'package:app/Style/Palette.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class ChampionTileWidget extends StatelessWidget {
  const ChampionTileWidget({super.key, required this.unitDto});

  final UnitDto unitDto;

  @override
  Widget build(BuildContext context) {
    Color costColor = Palette.rarityColor[unitDto.rarity];

    return Padding(
      padding: EdgeInsets.fromLTRB(0.4.w, 0, 0.4.w, 0),
      child: Column(
        children: [
          StarWidget(
              nums: unitDto.tier,
              color: costColor
          ),
          SizedBox(height: 1.h,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5.r),
              border: Border.all(
                  color: costColor,
                  width: 2.sp,
                  style: BorderStyle.solid
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.sp),
              child: Image.asset(
                Images.getChampionTileImagePath(unitDto.characterId),
                width: 25.sp,
                height: 25.sp,
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          ItemsListWidget(items: unitDto.itemNames,)
        ],
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
  final int nums;
  final Color color;

  const StarWidget({Key? key ,required this.nums , required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Widget star = Image.asset(
      Images.star,
      width: 9.sp,
      height: 9.sp,
      color: color,
    );

    switch(nums)
    {
      case 0:
        return SizedBox(height: 11.sp,);
      case 1:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            star,
          ],
        );
      case 2:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            star,
            star,
          ],
        );
      case 3:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            star,
            star,
            star,
          ],
        );
      default:
        return SizedBox(height:  11.sp,);
    }
  }
}

class ItemsListWidget extends StatelessWidget {
  final List<String> items;
  const ItemsListWidget({Key? key , required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 36.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: items.map((item) => ItemImageWidget(item: item)).toList(),
      ),
    );
  }
}

class ItemImageWidget extends StatelessWidget {
  final String item;
  const ItemImageWidget({Key? key , required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.5.w , right:0.5.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(2.sp)),
        child: Image.asset(
          Images.getItemImagePath(item),
          width: 10.sp,
          height: 10.sp,
          errorBuilder:(context, exception, stackTrace) {
            return Image.asset(
              Images.errorItemImage,
              width: 8.sp,
              height: 8.sp,
            );
          },
        ),
      ),
    );
  }
}

