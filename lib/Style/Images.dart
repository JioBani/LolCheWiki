import 'dart:io';

import 'package:app/Service/StaticLogger.dart';

class Images{

  static const IconImages icons = IconImages();

  static const String caitlyn = "assets/images/Caitlyn_19.jpg";
  static const String disk = "assets/images/disk.png";

  static const String testProfile = "https://ddragon.leagueoflegends.com/cdn/13.24.1/img/profileicon/5970.png";
  static const String tierTest = "assets/images/tier/Position_Master-Jungle.png";

  static const String championImage = "assets/images/champion_tile/TFT6_Lux.png";

  static const String star = "assets/images/match_history/star.png";
  static const String down = "assets/images/match_history/down.png";

  static const String tempChampionFullImage = "assets/images/champion_full/Blitzcrank_29.jpg";

  static List<String> traitTiers = [
    "assets/images/synergy_tier/bronze.png",
    "assets/images/synergy_tier/bronze.png",
    "assets/images/synergy_tier/silver.png",
    "assets/images/synergy_tier/gold.png",
    "assets/images/synergy_tier/chromatic.png",
    "assets/images/synergy_tier/chromatic.png",
    "assets/images/synergy_tier/chromatic.png",
  ];


  static String getChampionTileImagePath(String championId){
    return "assets/images/champion_tile/$championId.jpg";
  }

  static String traitDefaultImage = "assets/images/trait/Set10_8Bit.png";

  static String getTraitIconImagePath(String traitId){
    return "assets/images/trait/$traitId.png";
  }

  static String getItemImagePath(String item){
    return "assets/images/item/${item}.png";
  }

  static String errorItemImage = "assets/images/item/error.png";

  static String getRankImage(String? rank){
    switch(rank){
      case "BRONZE":
      case "CHALLENGER":
      case "DIAMOND":
      case "EMERALD":
      case "GOLD":
      case "GRANDMASTER":
      case "IRON":
      case "GOLD":
      case "MASTER":
      case "PLATINUM":
      case "SILVER" : return "assets/images/rank/$rank.png";
      default : {
        StaticLogger.logger.e("[Images.getRankImage()] 입력이 잘못됨 : $rank");
        return "assets/images/rank/UNRANK.png";
      }
    }
  }

  static String getChampionFullImage(String apiName){
    return tempChampionFullImage;
  }

  static String getChampionSkill(String apiName){
    return "assets/images/champion_skill/Blitzcrank.png";
  }
}

class IconImages{
  const IconImages();
  final String equals = "assets/images/icons/equals.png";
  final String bookmark = "assets/images/icons/bookmark.png";
  final String championIcon = "assets/images/icons/champion_icon.png";
  final String traitIcon = "assets/images/icons/trait_icon.png";
  final String itemIcon = "assets/images/icons/item_icon.png";
}
