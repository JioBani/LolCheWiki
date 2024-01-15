class MetadataDto {
  String dataVersion;
  String matchId;
  List<String> participants;

  MetadataDto({
    required this.dataVersion,
    required this.matchId,
    required this.participants,
  });

  factory MetadataDto.fromJson(Map<String, dynamic> json) {
    return MetadataDto(
      dataVersion: json['data_version'],
      matchId: json['match_id'],
      participants: (json['participants'] as List).map((i) => i as String).toList(),
    );
  }

  factory MetadataDto.test() {
    return MetadataDto(
      dataVersion: "version_test",
      matchId: "matchId_test",
      participants: [
        "participant_test",
        "participant_test",
        "participant_test",
        "participant_test",
        "participant_test",
        "participant_test",
        "participant_test",
        "participant_test",
      ],
    );
  }


  factory MetadataDto.none(){
    return MetadataDto(
      dataVersion: "none",
      matchId: "none",
      participants: [
        "none",
        "none",
        "none",
        "none",
        "none",
        "none",
        "none",
        "none",
      ],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data_version': dataVersion,
      'match_id': matchId,
      'participants': participants,
    };
  }

}
