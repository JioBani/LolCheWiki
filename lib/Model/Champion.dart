import 'package:app/Model/RiotApi/UnitDto.dart';
import 'package:app/Style/Images.dart';

class Champion{
  final String code;
  final String koreanName;
  final int cost;
  final String imagePath;

  Champion({required this.code , required this.koreanName, required this.cost , required this.imagePath});

  factory Champion.Lux(){
      return Champion(
        code: "0",
        koreanName: "럭스",
        cost: 5,
        imagePath: Images.championImage
      );
  }

  factory Champion.fromUnitDto(UnitDto unitDto){
    return Champion(
        code: unitDto.characterId,
        koreanName: unitDto.name,
        cost: unitDto.rarity,
        imagePath: Images.getChampionTileImagePath(unitDto.characterId)
    );
  }

}