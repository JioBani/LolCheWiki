import 'package:flutter/cupertino.dart';

import 'ParticipantDto.dart';

class InfoDto {
  int gameDatetime;
  num gameLength;
  String gameVariation;
  String gameVersion;
  List<ParticipantDto> participants;
  int queueId;
  int tftSetNumber;

  InfoDto({
    required this.gameDatetime,
    required this.gameLength,
    required this.gameVariation,
    required this.gameVersion,
    required this.participants,
    required this.queueId,
    required this.tftSetNumber,
  });

  factory InfoDto.fromJson(Map<String, dynamic> json) {
    try{
      return InfoDto(
        gameDatetime: json['game_datetime'],
        gameLength: json['game_length'],
        gameVariation: json['game_variation'] ?? "null",
        gameVersion: json['game_version'] ?? "null",
        participants: (json['participants'] as List)
            .map((i) => ParticipantDto.fromJson(i))
            .toList(),
        queueId: json['queue_id'],
        tftSetNumber: json['tft_set_number'],
      );
    }catch(e,s){
      debugPrint('$e\n$s');
      return InfoDto.error();
    }
  }

  factory InfoDto.none() {
    return InfoDto(
      gameDatetime: 0,
      gameLength: 0,
      gameVariation: "none",
      gameVersion: "none",
      participants: [

      ],
      queueId: 0,
      tftSetNumber: 0,
    );
  }

  factory InfoDto.error() {
    return InfoDto(
      gameDatetime: 0,
      gameLength: 0,
      gameVariation: "error",
      gameVersion: "error",
      participants: [

      ],
      queueId: 0,
      tftSetNumber: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'game_datetime': gameDatetime,
      'game_length': gameLength,
      'game_variation': gameVariation,
      'game_version': gameVersion,
      'participants': participants.map((e) => e.toJson()).toList(),
      'queue_id': queueId,
      'tft_set_number': tftSetNumber,
    };
  }

  String getGameName(){
    switch (queueId){
      case 1090 : return "일반";
      case 1100 : return "랭크";
      case 1110 : return "튜토리얼";
      case 1130 : return "초고속모드";
      case 1160 : return "더블 업";
      default : return "기타";
    }
  }
}
