import 'package:app/Model/RiotApi/TraitDto.dart';
import 'package:app/Style/Images.dart';

class Trait{
  String koreanName;
  String iconImagePath;

  Trait({
    required this.koreanName,
    required this.iconImagePath
  });

  factory Trait.test(){
    return Trait(
        koreanName: "테스트",
        iconImagePath : Images.traitDefaultImage
    );
  }

  factory Trait.fromJson(Map<String, dynamic> json){
    return Trait(
        koreanName: json['name'],
        iconImagePath: Images.getTraitIconImagePath(json['name'])
    );
  }
}