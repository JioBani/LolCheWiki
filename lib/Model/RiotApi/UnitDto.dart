class UnitDto {
  List<String> itemNames;
  String characterId;
  String? chosen;
  String name;
  int rarity;
  int tier;

  UnitDto({
    required this.itemNames,
    required this.characterId,
    this.chosen,
    required this.name,
    required this.rarity,
    required this.tier,
  });

  factory UnitDto.fromJson(Map<String, dynamic> json) {
    return UnitDto(
      itemNames: (json['itemNames']  as List).map((i) => i as String).toList(),
      characterId: json['character_id'],
      chosen: json['chosen'],
      name: json['name'],
      rarity: json['rarity'],
      tier: json['tier'],
    );
  }
  factory UnitDto.test() {
    return UnitDto(
      itemNames: [
        "테스트",
        "테스트",
        "테스트",
      ],
      characterId: "characterId_test",
      chosen: "chosen_test",
      name: "name_test",
      rarity: 1,
      tier: 0,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'itemNames': itemNames,
      'character_id': characterId,
      'chosen': chosen,
      'name': name,
      'rarity': rarity,
      'tier': tier,
    };
  }
}
