import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;


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
      desc: json['ability']['desc'] ?? "",
      icon: json['ability']['icon'] ?? "",
      name: json['ability']['name'] ?? "",
      variables: List<Map<String, dynamic>>.from(json['ability']['variables']),
    );
  }


  String completeDescription() {
    String completeDesc = desc.replaceAll(RegExp('<[^>]*>'), ''); // Remove HTML style text
    for (Map<String, dynamic> variable in variables) {
      String variableName = variable['name'];
      List<dynamic> variableValues = variable['value'];
      if (variableValues.length >= 3) {
        String valuesString = '[';
        for (int i = 1; i <= 3; i++) {
          valuesString += '${variableValues[i]} / ';
        }
        valuesString = valuesString.substring(0, valuesString.length - 3); // Remove the last ' / '
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
      armor: json['stats']['armor'] ?? 0,
      attackSpeed: json['stats']['attackSpeed'] ?? 0,
      critChance: json['stats']['critChance'] ?? 0,
      critMultiplier: json['stats']['critMultiplier'] ?? 0,
      damage: json['stats']['damage'] ?? 0,
      hp: json['stats']['hp'] ?? 0,
      initialMana: json['stats']['initialMana'] ?? 0,
      magicResist: json['stats']['magicResist'] ?? 0,
      mana: json['stats']['mana'] ?? 0,
      range: json['stats']['range'] ?? 0,
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
  List<String> traits;

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
    required this.traits,
  });

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      ability: Ability.fromJson(json),
      apiName: json['apiName'],
      characterName: json['characterName'],
      cost: json['cost'],
      icon: json['icon'],
      name: json['name'],
      squareIcon: json['squareIcon'],
      stats: Stats.fromJson(json),
      tileIcon: json['tileIcon'],
      traits: List<String>.from(json['traits']),
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
      'traits': traits,
    };
  }


}

Future<List<Champion>> createChampionsFromJsonFile(String filePath) async {
  try {
    // Read the JSON file
    File file = File(filePath);
    String content = await rootBundle.loadString(filePath);

    // Parse the JSON
    Map<String, dynamic> jsonData = json.decode(content);

    // Extract champions data from setData
    List<dynamic> championsData = jsonData['setData'][0]['champions'];

    // Create Champion objects from championsData
    List<Champion> champions = championsData.map((championData) {
      return Champion.fromJson(championData);
    }).toList();

    return champions;
  } catch (e , stacktrace) {
    print('Error creating Champions from JSON file: $e : $stacktrace');
    return [];
  }
}

