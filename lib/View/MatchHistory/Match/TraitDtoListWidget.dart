import 'package:app/Model/RiotApi/TraitDto.dart';
import 'package:app/Style/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TraitDtoListWidget extends StatelessWidget {
  const TraitDtoListWidget({super.key, required this.traitDtos});
  
  final List<TraitDto> traitDtos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.w , top: 5.h , bottom: 5.h),
      child: Row(
        children: traitDtos.map(
                (trait) =>
                trait.style > 0 ? TraitDtoImage(traitDto: trait) : const SizedBox()
        ).toList(),
      ),
    );
  }
}

class TraitDtoImage extends StatelessWidget {
  const TraitDtoImage({super.key, required this.traitDto});

  final TraitDto traitDto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 3.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Images.traitTiers[traitDto.style],
            width: 22.sp,
            height: 22.sp,
            errorBuilder: (context , error , stackTrace){
              return  Image.asset(
                Images.errorItemImage,
                width: 22.sp,
                height: 22.sp,
              );
            },
          ),
          Image.asset(
            Images.traitDefaultImage,
            width: 14.sp,
            height: 14.sp,
            color: Colors.black,
            errorBuilder: (context , error , stackTrace){
              return  Image.asset(
                Images.errorItemImage,
                width: 22.sp,
                height: 22.sp,
              );
            },
          ),
        ],
      ),
    );
  }
}

