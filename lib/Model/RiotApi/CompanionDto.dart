class CompanionDto {
  String contentId;
  int itemId;
  int skinId;
  String species;

  CompanionDto({
    required this.contentId,
    required this.itemId,
    required this.skinId,
    required this.species,
  });

  factory CompanionDto.fromJson(Map<String, dynamic> json) {
    return CompanionDto(
      contentId: json['content_ID'],
      itemId: json['item_ID'],
      skinId: json['skin_ID'],
      species: json['species'],
    );
  }

  factory CompanionDto.test() {
    return CompanionDto(
      contentId: "contentId_test",
      itemId: 0,
      skinId: 0,
      species:"species_test",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content_ID': contentId,
      'item_ID': itemId,
      'skin_ID': skinId,
      'species': species,
    };
  }
}
