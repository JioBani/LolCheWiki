import 'dart:io';

class Images{
  static const String caitlyn = "assets/images/Caitlyn_19.jpg";
  static const String disk = "assets/images/disk.png";

  static const String testProfile = "https://ddragon.leagueoflegends.com/cdn/13.24.1/img/profileicon/5970.png";
  static const String tierTest = "assets/images/tier/Position_Master-Jungle.png";

  static const String championImage = "assets/images/champion_tile/TFT6_Lux.png";

  static const String star = "assets/images/match_history/star.png";
  static const String down = "assets/images/match_history/down.png";

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

  static String traitDefaultImage = "assets/images/trait/Set10_8Bit.jpg";

  static String getTraitIconImagePath(String traitId){
    return "assets/images/trait/$traitId.png";
  }

  static String getItemImagePath(String item){
    return "assets/images/item/${item}.png";
  }

  static String errorItemImage = "assets/images/item/error.png";
}
