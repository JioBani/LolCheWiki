import 'package:app/Model/Trait.dart';
import 'package:app/Style/Images.dart';

class TraitDto {
  String name;
  int numUnits;
  int style;
  int tierCurrent;
  int tierTotal;

  Trait trait;

  TraitDto({
    required this.name,
    required this.numUnits,
    required this.style,
    required this.tierCurrent,
    required this.tierTotal,
    required this.trait
  });

  factory TraitDto.fromMap(Map<String, dynamic> json) {
    return TraitDto(
      name: json['name'],
      numUnits: json['num_units'],
      style: json['style'],
      tierCurrent: json['tier_current'],
      tierTotal: json['tier_total'],
      trait: Trait.fromMap(json)
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'num_units': numUnits,
      'style': style,
      'tier_current': tierCurrent,
      'tier_total': tierTotal,
    };
  }

  factory TraitDto.test(){
    return TraitDto(
        name : "test",
        trait: Trait.test(),
        numUnits: 3,
        style: 2,
        tierCurrent: 2,
        tierTotal: 3
    );
  }

  static int compare(TraitDto a , TraitDto b){
    if (a.style > b.style) {
      return -1;
    } else if (a.style < b.style) {
      return 1;
    } else {
      if(a.tierCurrent > b.tierCurrent){
        return -1;
      }
      else if(a.tierCurrent < b.tierCurrent){
        return 1;
      }
      else{
        return 0;
      }
    }
  }
}
