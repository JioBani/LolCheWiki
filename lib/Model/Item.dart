import 'package:app/Service/StaticLogger.dart';

enum ItemType{
  component,
  completed,
  emblem
}

class Item {
  final String apiName;
  final List<dynamic>? associatedTraits;
  final List<dynamic>? composition;
  final String? desc;
  final Map<String, num?>? effects;
  final List<dynamic>? from;
  final String? icon;
  dynamic id;
  final List<dynamic>? incompatibleTraits;
  final String? name;
  final bool? unique;
  final ItemType? type;
  final bool isError;

  Item({
    required this.apiName,
    this.associatedTraits,
    this.composition,
    this.desc,
    this.effects,
    this.from,
    this.icon,
    this.id,
    this.incompatibleTraits,
    this.name,
    this.unique,
    this.type,
    this.isError = false
  });

  Map<String, dynamic> toMap() {
    return {
      'apiName': apiName,
      'associatedTraits': associatedTraits,
      'composition': composition,
      'desc': desc,
      'effects': effects,
      'from': from,
      'icon': icon,
      'id': id,
      'incompatibleTraits': incompatibleTraits,
      'name': name,
      'unique': unique,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map , ItemType type) {
    try{
      return Item(
          apiName: map['apiName'],
          associatedTraits: List<dynamic>.from(map['associatedTraits'] ?? []),
          composition: List<dynamic>.from(map['composition'] ?? []),
          desc: map['desc'],
          effects: Map.from(map['effects']).map((key, value){
            try{
              return MapEntry(key, value);
            }catch(e){
              return MapEntry(key, null);
            }
          }),
          from: List<dynamic>.from(map['from'] ?? []),
          icon: map['icon'],
          id: map['id'],
          incompatibleTraits: List<dynamic>.from(map['incompatibleTraits'] ?? []),
          name: map['name'],
          unique: map['unique'],
          type: type
      );
    }catch(e){
      StaticLogger.logger.e(map);
      return Item.error();
    }
  }

  factory Item.error() {
    return Item(apiName: 'error',isError: true);
  }
}
