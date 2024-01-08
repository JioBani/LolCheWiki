import 'InfoDto.dart';
import 'MetadataDto.dart';

class MatchDto {
  MetadataDto metadata;
  InfoDto info;
  String matchId;

  MatchDto({
    required this.metadata,
    required this.info,
    required this.matchId,
  });

  factory MatchDto.fromJson(Map<String, dynamic> json , String matchId) {
    return MatchDto(
      matchId: matchId,
      metadata: MetadataDto.fromJson(json['metadata']),
      info: InfoDto.fromJson(json['info']),
    );
  }

  factory MatchDto.test() {
    return MatchDto(
      matchId: "text",
      metadata: MetadataDto.test(),
      info: InfoDto.test(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'metadata': metadata.toJson(),
      'info': info.toJson(),
    };
  }

  /// datetime이 큰 순으로 정렬
  static int compare(MatchDto a , MatchDto b){
    if (a.info.gameDatetime > b.info.gameDatetime) {
      return -1;
    } else if (a.info.gameDatetime < b.info.gameDatetime) {
      return 1;
    } else {
      return 0;
    }
  }
}