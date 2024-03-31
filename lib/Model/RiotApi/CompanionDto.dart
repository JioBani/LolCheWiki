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

  factory CompanionDto.fromMap(Map<String, dynamic> json) {
    return CompanionDto(
      contentId: json['content_ID'],
      itemId: json['item_ID'],
      skinId: json['skin_ID'],
      species: json['species'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content_ID': contentId,
      'item_ID': itemId,
      'skin_ID': skinId,
      'species': species,
    };
  }
}
