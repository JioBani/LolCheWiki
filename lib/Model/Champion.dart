import 'package:app/Model/Trait.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Ability {
  String desc;
  String icon;
  String name;
  List<Map<String, dynamic>> variables;

  Ability({
    required this.desc,
    required this.icon,
    required this.name,
    required this.variables,
  });

  Map<String, dynamic> toMap() {
    return {
      'desc': desc,
      'icon': icon,
      'name': name,
      'variables': variables,
    };
  }


  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      desc: json['desc'] ?? "",
      icon: json['icon'] ?? "",
      name: json['name'] ?? "",
      variables: List<Map<String, dynamic>>.from(json['variables']),
    );
  }

  String getCompleteDescription() {
    String completeDesc = desc.replaceAll(RegExp('<[^>]*>'), '');
    for (Map<String, dynamic> variable in variables) {
      String variableName = variable['name'];
      List<dynamic> variableValues = variable['value'];
      if (variableValues.length >= 3) {
        String valuesString = '[';
        for (int i = 1; i <= 3; i++) {
          valuesString += '${variableValues[i]} / ';
        }
        valuesString = valuesString.substring(0, valuesString.length - 3);
        valuesString += ']';
        completeDesc = completeDesc.replaceAll('@$variableName@', valuesString);
      }
    }
    return completeDesc;
  }
}

class Stats {
  num armor;
  num attackSpeed;
  num critChance;
  num critMultiplier;
  num damage;
  num hp;
  num initialMana;
  num magicResist;
  num mana;
  num range;

  Stats({
    required this.armor,
    required this.attackSpeed,
    required this.critChance,
    required this.critMultiplier,
    required this.damage,
    required this.hp,
    required this.initialMana,
    required this.magicResist,
    required this.mana,
    required this.range,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      armor: json['armor'] ?? 0,
      attackSpeed: json['attackSpeed'] ?? 0,
      critChance: json['critChance'] ?? 0,
      critMultiplier: json['critMultiplier'] ?? 0,
      damage: json['damage'] ?? 0,
      hp: json['hp'] ?? 0,
      initialMana: json['initialMana'] ?? 0,
      magicResist: json['magicResist'] ?? 0,
      mana: json['mana'] ?? 0,
      range: json['range'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'armor': armor,
      'attackSpeed': attackSpeed,
      'critChance': critChance,
      'critMultiplier': critMultiplier,
      'damage': damage,
      'hp': hp,
      'initialMana': initialMana,
      'magicResist': magicResist,
      'mana': mana,
      'range': range,
    };
  }

}

class Champion {
  Ability ability;
  String apiName;
  String characterName;
  int cost;
  String icon;
  String name;
  String squareIcon;
  Stats stats;
  String tileIcon;
  List<String> traitNames;
  final List<Trait> traits = [];

  Champion({
    required this.ability,
    required this.apiName,
    required this.characterName,
    required this.cost,
    required this.icon,
    required this.name,
    required this.squareIcon,
    required this.stats,
    required this.tileIcon,
    required this.traitNames,
  });

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      ability: Ability.fromJson(json['ability']),
      apiName: json['apiName'],
      characterName: json['characterName'],
      cost: json['cost'],
      icon: json['icon'],
      name: json['name'],
      squareIcon: json['squareIcon'],
      stats: Stats.fromJson(json['stats']),
      tileIcon: json['tileIcon'],
      traitNames: List<String>.from(json['traits']),
    );
  }

  factory Champion.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return Champion(
      ability: Ability.fromJson(data['ability']),
      apiName: data['apiName'],
      characterName: data['characterName'],
      cost: data['cost'],
      icon: data['icon'],
      name: data['name'],
      squareIcon: data['squareIcon'],
      stats: Stats.fromJson(data['stats']),
      tileIcon: data['tileIcon'],
      traitNames: List<String>.from(data['traits']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ability': ability.toMap(),
      'apiName': apiName,
      'characterName': characterName,
      'cost': cost,
      'icon': icon,
      'name': name,
      'squareIcon': squareIcon,
      'stats': stats.toMap(),
      'tileIcon': tileIcon,
      'traits': traitNames,
    };
  }

  static int sortByCost(Champion a, Champion b){
    return a.cost.compareTo(b.cost);
  }

  static int sortByName(Champion a , Champion b){
    return a.name.compareTo(b.name);
  }

  static int sortByTrait(Champion a , Champion b){
    return a.traitNames[0].compareTo(b.traitNames[0]);
  }

  void addTrait(Trait trait){
    traits.add(trait);
  }

}
