import 'package:app/Model/Champion.dart';
import 'package:app/Service/StaticLogger.dart';

enum TraitType{
  origins,
  classes
}

class Trait {
  final String apiName;
  final String desc;
  final List<Effect> effects;
  final String icon;
  final String name;
  late final String iconImagePath;
  final List<Champion> members = [];
  late final TraitType type;

  Trait({
    required this.apiName,
    required this.desc,
    required this.effects,
    required this.icon,
    required this.name,
  }){
    iconImagePath = 'test';
  }

  Map<String, dynamic> toMap() {
    return {
      'apiName': apiName,
      'desc': desc,
      'effects': effects.map((x) => x.toMap()).toList(),
      'icon': icon,
      'name': name,
    };
  }

  factory Trait.fromMap(Map<String, dynamic> map) {
    return Trait(
      apiName: map['apiName'] ?? '',
      desc: map['desc'] ?? '',
      effects: map['effects'] == null ? [] : List<Effect>.from(map['effects']?.map((x) => Effect.fromMap(x))),
      icon: map['icon'] ?? '',
      name: map['name'] ?? '',
    );
  }

  factory Trait.test() {
    return Trait(
      apiName: '테스트',
      desc: '테스트',
      effects: [Effect.test()],
      icon: '테스트',
      name: '테스트',
    );
  }

  String getFormatDescription() {
    var formattedDesc = desc;
    Map<String, List<String>> variablesMap = {};

    for (final effect in effects) {
      effect.variables.forEach((key, value) {
        var variableName = key.replaceAll(RegExp(r'{|}'), '');
        variablesMap.putIfAbsent(variableName, () => []).add(value.toString());
      });
      variablesMap.putIfAbsent('MinUnits', () => []).add(effect.minUnits.toString());
    }

    RegExp variablePattern = RegExp(r'@(\w+)@');
    formattedDesc = formattedDesc.replaceAllMapped(variablePattern, (match) {
      var variableName = match.group(1)!;
      if (variablesMap[variableName] != null && variablesMap[variableName]!.isNotEmpty) {
        return variablesMap[variableName]!.removeAt(0);
      } else {
        return '?';
      }
    });

    return formattedDesc;
  }

  void addMember(Champion member){
    members.add(member);
  }

  void setType(TraitType type){
    this.type = type;
  }

}

class Effect {
  final int maxUnits;
  final int minUnits;
  final int style;
  final Map<String, dynamic> variables;

  Effect({
    required this.maxUnits,
    required this.minUnits,
    required this.style,
    required this.variables,
  });

  Map<String, dynamic> toMap() {
    return {
      'maxUnits': maxUnits,
      'minUnits': minUnits,
      'style': style,
      'variables': variables,
    };
  }

  factory Effect.fromMap(Map<String, dynamic> map) {
    try{
      return Effect(
        maxUnits: map['maxUnits'],
        minUnits: map['minUnits'],
        style: map['style'],
        variables: Map<String, dynamic>.from(map['variables']),
      );
    }catch(e,s){
     StaticLogger.logger.e('$e\n$s');
     rethrow;
    }
  }

  factory Effect.test() {
    return Effect(
      maxUnits: 0,
      minUnits: 0,
      style: 0,
      variables: {'test':0},
    );
  }
}
