enum QueueType{
  /*case 1090 : return "일반";
  case 1100 : return "랭크";
  case 1110 : return "튜토리얼";
  case 1130 : return "초고속모드";
  case 1160 : return "더블 업";
  default : return "기타";*/

  none,
  normal,
  ranked,
  hyperRoll,
  doubleUp,
}

extension QueueTypeExtension on QueueType {

  String getGameName(){
    switch (this){
      case QueueType.none : return "기타";
      case QueueType.normal : return "랭크";
      case QueueType.ranked : return "튜토리얼";
      case QueueType.hyperRoll : return "초고속모드";
      case QueueType.doubleUp : return "더블 업";
      default : return "기타";
    }
  }

  static QueueType getTypeByQueueId(int id){
    switch (id){
      case 1090 : return QueueType.normal;
      case 1100 : return QueueType.ranked;
      case 1110 : return QueueType.none;
      case 1130 : return QueueType.hyperRoll;
      case 1160 : return QueueType.doubleUp;
      default : return QueueType.none;
    }
  }

  static QueueType getTypeByIndex(int index){
    switch (index){
      case 1 : return QueueType.ranked;
      case 2 : return QueueType.hyperRoll;
      case 3 : return QueueType.doubleUp;
      case 4 : return QueueType.normal;
      default : return QueueType.none;
    }
  }

  static String getStringByIndex(int index){
    return getTypeByIndex(index).getGameName();
  }
}