import 'package:app/Model/RiotApi/UnitDto.dart';
import 'package:app/Style/Images.dart';

class MatchChampion{
  final String code;
  final String koreanName;
  final int cost;
  final String imagePath;

  MatchChampion({required this.code , required this.koreanName, required this.cost , required this.imagePath});

  factory MatchChampion.fromUnitDto(UnitDto unitDto){
    return MatchChampion(
        code: unitDto.characterId,
        koreanName: unitDto.name,
        cost: unitDto.rarity,
        imagePath: Images.getChampionTileImagePath(unitDto.characterId)
    );
  }

}