import 'package:app/Admin/itemJson.dart';
import 'package:app/Service/StaticLogger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin{
  static Future<void> uploadTrait(Map<String , dynamic> map) async {
    try{
      await FirebaseFirestore.instance.collection('traits').doc(map['apiName']).set(map);
    }catch(e){
      StaticLogger.logger.e(e);
    }
  }

  static Future<void> uploadTraitList() async {
    try{
      Map<String , dynamic> map = {
        "data" : [
          {
            "apiName": "Set10_Emo",
            "desc": "이모코어 챔피언의 스킬 마나 소모량이 감소하고 아군 챔피언이 죽을 때마다 마나를 얻습니다.<br><br><row>(@MinUnits@) @InitialMana@% 감소, @StackingMana@ %i:scaleMana% 획득</row><br><row>(@MinUnits@) @InitialMana@% 감소, @StackingMana@ %i:scaleMana% 획득</row><br><row>(@MinUnits@) @BonusAP@ %i:scaleAP% @InitialMana@% 감소, @StackingMana@ %i:scaleMana% 획득 </row>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "{d5032a3e}": 20.0,
                  "{fbc36e44}": 20.0
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 4,
                "variables": {
                  "{d5032a3e}": 30.0,
                  "{fbc36e44}": 30.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "BonusAP": 10.0,
                  "{d5032a3e}": 40.0,
                  "{fbc36e44}": 40.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_BigSad.TFT_Set10.tex",
            "name": "이모코어"
          },
          {
            "apiName": "Set10_Sentinel",
            "desc": "아군이 방어력과 마법 저항력을 얻습니다. 감시자는 효과가 두 배가 됩니다.<br><br><expandRow>(@MinUnits@) @BonusArmor@ %i:scaleArmor%, @BonusArmor@ %i:scaleMR%</expandRow>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "BonusArmor": 16.0,
                  "{a624ed1a}": 32.0
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 3,
                "variables": {
                  "BonusArmor": 35.0,
                  "{a624ed1a}": 70.0
                }
              },
              {
                "maxUnits": 7,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "BonusArmor": 55.0,
                  "{a624ed1a}": 110.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 8,
                "style": 4,
                "variables": {
                  "BonusArmor": 100.0,
                  "{a624ed1a}": 200.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Warden.TFT_Set10.tex",
            "name": "감시자"
          },
          {
            "apiName": "Set10_Guardian",
            "desc": "전투당 1회 체력이 @PercentHealthThreshold@%일 때 가장 가까운 아군과 자신에게 최대 체력의 일정 비율만큼 피해를 흡수하는 보호막을 씌웁니다.<br><br><expandRow>(@MinUnits@) @ShieldPercentAmount@%</expandRow>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "PercentHealthThreshold": 50.0,
                  "ShieldPercentAmount": 25.0
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 3,
                "variables": {
                  "PercentHealthThreshold": 50.0,
                  "ShieldPercentAmount": 45.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "PercentHealthThreshold": 50.0,
                  "ShieldPercentAmount": 70.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_7_Guardian.tex",
            "name": "수호자"
          },
          {
            "apiName": "Set10_TrueDamage",
            "desc": "True Damage 챔피언이 추가 고정 피해를 입힙니다. True Damage 챔피언이 아이템을 보유 중일 경우 스킬에 고유 반짝반짝 보너스가 추가됩니다.<br><br><row>(@MinUnits@) 피해량 <trueDamage>@BONUS_DAMAGE*100@%</trueDamage></row><br><row>(@MinUnits@) 피해량 <trueDamage>@BONUS_DAMAGE*100@%</trueDamage></row><br><row>(@MinUnits@) 피해량 <trueDamage>@BONUS_DAMAGE*100@%</trueDamage></row><br><row>(@MinUnits@) 피해량 <trueDamage>@BONUS_DAMAGE*100@%</trueDamage>. 반짝반짝 보너스가 플래티넘이 됩니다!</row>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "{72ce596c}": 0.15000000596046448,
                  "{744944d9}": 1.0,
                  "{d1eaafe0}": "null"
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 3,
                "variables": {
                  "{72ce596c}": 0.30000001192092896,
                  "{744944d9}": 1.0,
                  "{d1eaafe0}": "null"
                }
              },
              {
                "maxUnits": 8,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "{72ce596c}": 0.44999998807907104,
                  "{744944d9}": 1.0,
                  "{d1eaafe0}": "null"
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 9,
                "style": 5,
                "variables": {
                  "{72ce596c}": 0.9900000095367432,
                  "{744944d9}": 1.0,
                  "{d1eaafe0}": 1.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_TrueDamage.TFT_Set10.tex",
            "name": "True Damage"
          },
          {
            "apiName": "Set10_Country",
            "desc": "아군이 @HealthRatio*100@%의 체력을 잃으면 공포마를 불러 아군을 강화합니다. 컨트리 별 레벨 하나당 공포마의 체력과 공격력이 증가합니다.<br><br><row>(@MinUnits@) 공포마</row><br><row>(@MinUnits@) 한밤의 공포마</row><br><row>(@MinUnits@) 지옥의 기원 공포마</row>",
            "effects": [
              {
                "maxUnits": 4,
                "minUnits": 3,
                "style": 1,
                "variables": {
                  "BonusResists": "null",
                  "Level": 1.0
                }
              },
              {
                "maxUnits": 6,
                "minUnits": 5,
                "style": 4,
                "variables": {
                  "BonusResists": 15.0,
                  "Level": 2.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 7,
                "style": 4,
                "variables": {
                  "BonusResists": 50.0,
                  "Level": 3.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Country.TFT_Set10.tex",
            "name": "컨트리"
          },
          {
            "apiName": "Set10_8Bit",
            "desc": "아군이 입힌 피해를 기록합니다. 최고 기록을 경신할 때마다 8비트 챔피언의 공격력이 증가합니다.<br><br><row>(@MinUnits@) @AttackDamage@% %i:scaleAD%</row><br><row>(@MinUnits@) @AttackDamage@% %i:scaleAD%</row><br><row>(@MinUnits@) @AttackDamage@% %i:scaleAD% 및 큰 보상을 받는 최종 최고 기록을 얻습니다.</row><br><br>보너스: @TFTUnitProperty.trait:TFT10_Trait_8bit_CurrentBonus@% %i:scaleAD% (@TFTUnitProperty.trait:TFT10_Trait_8bit_StackCount@/@NumHighScores@)",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "AttackDamage": 5.0
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 4,
                "variables": {
                  "AttackDamage": 9.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "AttackDamage": 14.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_8Bit.TFT_Set10.tex",
            "name": "8비트"
          },
          {
            "apiName": "Set10_Breakout",
            "desc": "(고유) 아칼리는 K/DA와 True Damage에 모두 소속되어 있으며, 전장에 있는 챔피언의 특성 수에 따라 소속이 결정됩니다. 아칼리는 취하는 형태에 따라 스킬이 달라집니다. ",
            "effects": [
              {
                "maxUnits": 25000,
                "minUnits": 1,
                "style": 6,
                "variables": {}
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Breakout.TFT_Set10.tex",
            "name": "빅히트"
          },
          {
            "apiName": "Set10_Spellweaver",
            "desc": "아군이 @TeamwideAP@의 주문력을 얻습니다. 주문술사는 효과가 증가합니다. 주문술사가 스킬을 사용하면 모든 주문술사가 추가 주문력을 얻습니다.<br><br><expandRow>(@MinUnits@) +@AP@ %i:scaleAP%, 사용할 때마다 +@BonusAP@ %i:scaleAP%</expandRow>",
            "effects": [
              {
                "maxUnits": 4,
                "minUnits": 3,
                "style": 1,
                "variables": {
                  "AP": 20.0,
                  "BonusAP": 1.0
                }
              },
              {
                "maxUnits": 6,
                "minUnits": 5,
                "style": 3,
                "variables": {
                  "AP": 35.0,
                  "BonusAP": 2.0
                }
              },
              {
                "maxUnits": 8,
                "minUnits": 7,
                "style": 4,
                "variables": {
                  "AP": 70.0,
                  "BonusAP": 3.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 9,
                "style": 4,
                "variables": {
                  "AP": 120.0,
                  "BonusAP": 4.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_5_Sorcerer.tex",
            "name": "주문술사"
          },
          {
            "apiName": "Set10_Hyperpop",
            "desc": "하이퍼팝 챔피언이 스킬 사용 시 가장 가까운 아군 @NumOfAllies@명에게 마나를 부여하고 @BuffDuration@초 동안 공격 속도를 증가시킵니다.<br><br><expandRow>(@MinUnits@) @Mana@ %i:scaleMana% 및 @AS*100@% %i:scaleAS%</expandRow>",
            "effects": [
              {
                "maxUnits": 1,
                "minUnits": 1,
                "style": 1,
                "variables": {
                  "AS": 0.10000000149011612,
                  "Mana": 5.0
                }
              },
              {
                "maxUnits": 2,
                "minUnits": 2,
                "style": 4,
                "variables": {
                  "AS": 0.20000000298023224,
                  "Mana": 10.0
                }
              },
              {
                "maxUnits": 3,
                "minUnits": 3,
                "style": 4,
                "variables": {
                  "AS": 0.3499999940395355,
                  "Mana": 15.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 4,
                "style": 4,
                "variables": {
                  "AS": 0.6000000238418579,
                  "Mana": 20.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Hyperpop.TFT_Set10.tex",
            "name": "하이퍼팝"
          },
          {
            "apiName": "Set10_Pentakill",
            "desc": "펜타킬 챔피언이 받는 피해가 15% 감소하고 추가 피해를 입힙니다. 챔피언을 처치할 때마다 펜타킬 챔피언이 록에 취해 추가 피해량이 @Kill_Bonus*100@% 증가합니다.<br><br>@Kill_Count@명 처치 시 모든 펜타킬 챔피언이 록에 취해 아군이 @Attack_Speed*100@%의 공격 속도를 얻습니다.<br><br><row>(@MinUnits@) 추가 피해량 @Bonus_Damage*100@%</row><br><row>(@MinUnits@) 추가 피해량 @Bonus_Damage*100@%</row><br><row>(@MinUnits@) 추가 피해량 @Bonus_Damage*100@%</row><br><row>(@MinUnits@) 피해량 감소 50%, 추가 피해량 @Bonus_Damage*100@%</row>",
            "effects": [
              {
                "maxUnits": 4,
                "minUnits": 3,
                "style": 1,
                "variables": {
                  "{0082059a}": 0.15000000596046448,
                  "{72ce596c}": 0.15000000596046448
                }
              },
              {
                "maxUnits": 6,
                "minUnits": 5,
                "style": 3,
                "variables": {
                  "{0082059a}": 0.15000000596046448,
                  "{72ce596c}": 0.30000001192092896
                }
              },
              {
                "maxUnits": 9,
                "minUnits": 7,
                "style": 4,
                "variables": {
                  "{0082059a}": 0.15000000596046448,
                  "{72ce596c}": 0.44999998807907104
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 10,
                "style": 5,
                "variables": {
                  "{0082059a}": 0.5,
                  "{72ce596c}": 0.9900000095367432
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Pentakill.TFT_Set10.tex",
            "name": "펜타킬"
          },
          {
            "apiName": "Set10_IllBeats",
            "desc": "(고유) 일라오이의 별 레벨에 따라 전장에 놓을 수 있는 @1Star@/@2Star@/@3Star@성 영혼 촉수를 획득합니다. 촉수는 일라오이의 추가 방어력 및 마법 저항력을 얻습니다.",
            "effects": [
              {
                "maxUnits": 1,
                "minUnits": 1,
                "style": 6,
                "variables": {
                  "{3710b88a}": 8.0,
                  "{a2ff8b24}": 2.0,
                  "{aea98661}": 2.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_ILLBeats.TFT_Set10.tex",
            "name": "일류 비트"
          },
          {
            "apiName": "Set10_TwoSides",
            "desc": "(고유) 플레이어 대상 전투에서 승리 시 케인이 그림자 암살자가 됩니다. 그러지 못할 경우에는 라아스트가 됩니다. 케인이 적 챔피언 @NumOfKills@명을 처치할 때마다 형태에 따라 보상을 획득합니다. <br><br><TFTBonus enabled=TFT10_WildcardShadowAssassin alternate=rules>그림자 암살자: @AssassinGoldPerKill@골드</TFTBonus><br><TFTBonus enabled=TFT10_WildcardRhaast alternate=rules>라아스트: 플레이어 체력 @RhaastPlayerHealthPerKill@</TFTBonus>",
            "effects": [
              {
                "maxUnits": 25000,
                "minUnits": 1,
                "style": 6,
                "variables": {
                  "{4e56df0d}": 3.0,
                  "{72ccc5a0}": 1.0,
                  "{f18bef8b}": 2.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Wildcard.TFT_Set10.tex",
            "name": "와일드카드"
          },
          {
            "apiName": "Set10_Edgelord",
            "desc": "이단아가 공격 속도를 얻습니다. 대상의 체력이 @HealthRatio*100@% 아래로 떨어지면 증가량이 두 배가 됩니다. 또한 사거리가 1칸인 이단아가 다음 기본 공격 시 돌진하면서 적을 통과합니다. <br><br><expandRow>(@MinUnits@) @AttackSpeed*100@% %i:scaleAS%</expandRow><br>",
            "effects": [
              {
                "maxUnits": 4,
                "minUnits": 3,
                "style": 1,
                "variables": {
                  "AttackSpeed": 0.30000001192092896
                }
              },
              {
                "maxUnits": 6,
                "minUnits": 5,
                "style": 3,
                "variables": {
                  "AttackSpeed": 0.44999998807907104
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 7,
                "style": 4,
                "variables": {
                  "AttackSpeed": 0.699999988079071
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Edgelord.TFT_Set10.tex",
            "name": "이단아"
          },
          {
            "apiName": "Set10_Executioner",
            "desc": "처형자는 치명타 피해량이 증가하며, 스킬에 치명타가 적용될 수 있습니다. 대상이 잃은 체력에 따라 치명타 확률이 증가합니다.<br><br><expandRow>(@MinUnits@) @CRIT_DAMAGE*100@% %i:scaleCritMult%. 최대 @CRIT_PERCENT*100@% %i:scaleCrit%</expandRow>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "{b22e2df3}": 0.05000000074505806,
                  "{c009a26f}": 0.25
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 3,
                "variables": {
                  "{b22e2df3}": 0.15000000596046448,
                  "{c009a26f}": 1.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "{b22e2df3}": 0.30000001192092896,
                  "{c009a26f}": 2.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_4_Executioner.tex",
            "name": "처형자"
          },
          {
            "apiName": "Set10_Superfan",
            "desc": "열혈 팬이 헤드라이너를 강화합니다.<br><br><row> (@MinUnits@) 헤드라이너가 완성 아이템을 획득합니다.</row><br><row> (@MinUnits@) 헤드라이너가 @HealthBonus@의 추가 체력 %i:scaleHealth% 및 @OmnivampBonus*100@%의 모든 피해 흡혈을 얻습니다. <TFTKeyword>모든 피해 흡혈</TFTKeyword></row><br><row> (@MinUnits@) 아이템이 찬란한 아이템으로 강화됩니다.</row><br><br><rules>모든 피해 흡혈: 입힌 피해량의 일부만큼 체력을 회복합니다.</rules>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 3,
                "style": 1,
                "variables": {}
              },
              {
                "maxUnits": 4,
                "minUnits": 4,
                "style": 3,
                "variables": {}
              },
              {
                "maxUnits": 25000,
                "minUnits": 5,
                "style": 4,
                "variables": {}
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Superfan.TFT_Set10.tex",
            "name": "열혈 팬"
          },
          {
            "apiName": "Set10_DJ",
            "desc": "(고유) 모드를 선택하여 믹스마스터의 기본 공격과 스킬을 변화시킵니다.",
            "effects": [
              {
                "maxUnits": 25000,
                "minUnits": 1,
                "style": 6,
                "variables": {}
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_DJ.TFT_Set10.tex",
            "name": "믹스마스터"
          },
          {
            "apiName": "Set10_Deadeye",
            "desc": "거물이 공격력을 얻습니다. 스킬 사용 시 @Duration@초 동안 효과가 증가합니다.<br><br><expandRow>(@MinUnits@) @PercentAD*100@% %i:scaleAD%, 사용 후 @PercentADEmpowered*100@%</expandRow>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "PercentAD": 0.10000000149011612,
                  "{4ce8f18b}": 0.4000000059604645
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 4,
                "variables": {
                  "PercentAD": 0.18000000715255737,
                  "{4ce8f18b}": 0.7200000286102295
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "PercentAD": 0.30000001192092896,
                  "{4ce8f18b}": 1.2000000476837158
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_BigShot.TFT_Set10.tex",
            "name": "거물"
          },
          {
            "apiName": "Set10_CrowdDive",
            "desc": "스테이지 다이버가 죽은 후 가장 먼 적에게 도약해 <magicDamage>@JumpDamage@</magicDamage>의 마법 피해를 입힙니다. @StunRange@칸 내의 적을 @StunDuration@초 동안 기절시킵니다.<br><br>또한 추가 피해를 입히며, 매초 피해량이 @BonusPerSecond*100@%만큼 증가합니다.<br><br><expandRow>(@MinUnits@) 추가 피해량 @BaseBonus*100@%</expandRow>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "{a5be9a7f}": 0.11999999731779099
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 4,
                "variables": {
                  "{a5be9a7f}": 0.30000001192092896
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "{a5be9a7f}": 0.5
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_CrowdDiver.TFT_Set10.tex",
            "name": "스테이지 다이버"
          },
          {
            "apiName": "Set10_KDA",
            "desc": "빛나는 칸에 있는 아군이 최대 체력과 주문력, 공격력을 얻습니다. K/DA 챔피언일 경우 증가량이 두 배가 됩니다.<br><br><row>(@MinUnits@) 최대 %i:scaleHealth%의 @BonusMaxHealth*100@%, @BonusAP@% %i:scaleAP%%i:scaleAD%</row><br><row>(@MinUnits@) 최대 %i:scaleHealth%의 @BonusMaxHealth*100@%, @BonusAP@% %i:scaleAP%%i:scaleAD%</row><br><row>(@MinUnits@) 최대 %i:scaleHealth%의 @BonusMaxHealth*100@%, @BonusAP@% %i:scaleAP%%i:scaleAD%</row><br><row>(@MinUnits@) 최대 %i:scaleHealth%의 @BonusMaxHealth*100@%, @BonusAP@% %i:scaleAP%%i:scaleAD%, 초당 마나 @ManaPerSecond@ </row>",
            "effects": [
              {
                "maxUnits": 4,
                "minUnits": 3,
                "style": 1,
                "variables": {
                  "BonusAP": 9.0,
                  "BonusMaxHealth": 0.09000000357627869,
                  "ManaPerSecond": "null",
                  "{158db106}": 2.0
                }
              },
              {
                "maxUnits": 6,
                "minUnits": 5,
                "style": 3,
                "variables": {
                  "BonusAP": 15.0,
                  "BonusMaxHealth": 0.15000000596046448,
                  "ManaPerSecond": "null",
                  "{158db106}": 2.0
                }
              },
              {
                "maxUnits": 9,
                "minUnits": 7,
                "style": 4,
                "variables": {
                  "BonusAP": 24.0,
                  "BonusMaxHealth": 0.23999999463558197,
                  "ManaPerSecond": "null",
                  "{158db106}": 2.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 10,
                "style": 5,
                "variables": {
                  "BonusAP": 40.0,
                  "BonusMaxHealth": 0.4000000059604645,
                  "ManaPerSecond": 10.0,
                  "{158db106}": 2.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_KDA.TFT_Set10.tex",
            "name": "K/DA"
          },
          {
            "apiName": "Set10_Classical",
            "desc": "(고유) 마에스트로는 항상 고정된 속도로 공격하며 @BonusAttackSpeed@%의 추가 공격 속도를 @BonusAttackDamage@%의 공격력으로 전환합니다. ",
            "effects": [
              {
                "maxUnits": 25000,
                "minUnits": 1,
                "style": 6,
                "variables": {
                  "BonusAttackDamage": 0.699999988079071,
                  "BonusAttackSpeed": 1.0,
                  "{3c4f17cb}": 0.8999999761581421,
                  "{48d42308}": 2.0,
                  "{7fd29f41}": 10.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Classical.TFT_Set10.tex",
            "name": "마에스트로"
          },
          {
            "apiName": "Set10_Funk",
            "desc": "이동 가능한 디스코 볼을 소환합니다. <br><br>전투 시작: 디스코 볼 옆에 있는 아군이 공격 속도를 얻습니다. 또한 전투 시작 즉시, 이후 @TickRate@초마다 체력을 회복합니다.<br><br><row>(@MinUnits@) @AttackSpeed*100@% %i:scaleAS%, 최대 %i:scaleHealth%의 @Healing*100@%</row><br><row>(@MinUnits@) @AttackSpeed*100@% %i:scaleAS%, 최대 %i:scaleHealth%의 @Healing*100@%</row><br><row>(@MinUnits@) 디스코 볼 2개, @AttackSpeed*100@% %i:scaleAS%, 최대 %i:scaleHealth%의 @Healing*100@%</row><br><row>(@MinUnits@) @AttackSpeed*100@% %i:scaleAS%, 최대 %i:scaleHealth%의 @Healing*100@%</row>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 3,
                "style": 1,
                "variables": {
                  "AttackSpeed": 0.05000000074505806,
                  "Healing": 0.019999999552965164,
                  "{11b35e1c}": 1.0
                }
              },
              {
                "maxUnits": 4,
                "minUnits": 4,
                "style": 3,
                "variables": {
                  "AttackSpeed": 0.07999999821186066,
                  "Healing": 0.029999999329447746,
                  "{11b35e1c}": 1.0
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 5,
                "style": 4,
                "variables": {
                  "AttackSpeed": 0.11999999731779099,
                  "Healing": 0.029999999329447746,
                  "{11b35e1c}": 2.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "AttackSpeed": 0.20000000298023224,
                  "Healing": 0.03999999910593033,
                  "{11b35e1c}": 2.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Funk.TFT_Set10.tex",
            "name": "디스코"
          },
          {
            "apiName": "Set10_Fighter",
            "desc": "춤꾼이 공격 속도와 <TFTKeyword>모든 피해 흡혈</TFTKeyword>을 얻습니다. 잃은 체력에 따라 최대 @AmountIncrease*100@%까지 증가합니다. <br><br><expandRow>(@MinUnits@) @FighterAS@% %i:scaleAS%, 모든 피해 흡혈 @FighterVamp@% </expandRow><br><br><rules>모든 피해 흡혈: 입힌 피해량의 일부만큼 체력을 회복합니다.</rules>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "{ad27681e}": 20.0,
                  "{c771aaaa}": 10.0
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 3,
                "variables": {
                  "{ad27681e}": 40.0,
                  "{c771aaaa}": 15.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "{ad27681e}": 70.0,
                  "{c771aaaa}": 20.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Mosher.TFT_Set10.tex",
            "name": "춤꾼"
          },
          {
            "apiName": "Set10_Quickshot",
            "desc": "아군이 @TeamwideAttackSpeed*100@%의 공격 속도를 얻습니다.<br><br>속사포 챔피언은 기본 공격 시 중첩을 얻으며, 최대 @MaxStacks@회 중첩됩니다.<br><br><expandRow>(@MinUnits@) @PercentAS*100@% %i:scaleAS%</expandRow>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "MaxStacks": 10.0,
                  "{ec3d43d6}": 0.03999999910593033
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 3,
                "variables": {
                  "MaxStacks": 10.0,
                  "{ec3d43d6}": 0.07999999821186066
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "MaxStacks": 10.0,
                  "{ec3d43d6}": 0.14000000059604645
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Rapidfire.TFT_Set10.tex",
            "name": "속사포"
          },
          {
            "apiName": "Set10_PunkRock",
            "desc": "펑크가 추가 체력과 공격력을 얻습니다. 상점 새로고침에 골드를 소모할 때마다 효과가 1% 증가합니다.<br><br>펑크가 전투에 참여한 후 첫 상점 새로고침 비용이 1골드가 되고 @FIRST_ROLL_BONUS@%의 보너스를 얻습니다.<br><br><expandRow>(@MinUnits@) @BONUS_HEALTH@ %i:scaleHealth% 및 @BONUS_AD_AP*100@% %i:scaleAD%</expandRow><br><br>현재 보너스: @TFTUnitProperty.trait:TFT10_Punk_CurrentBonus@%<br>@TFTUnitProperty.trait:TFT10_Punk_CurrentHealthBonus@ %i:scaleHealth% 및 @TFTUnitProperty.trait:TFT10_Punk_CurrentADBonus@% %i:scaleAD%",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "{a3869f33}": 180.0,
                  "{f6501cf8}": 0.18000000715255737
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 4,
                "variables": {
                  "{a3869f33}": 300.0,
                  "{f6501cf8}": 0.30000001192092896
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "{a3869f33}": 450.0,
                  "{f6501cf8}": 0.44999998807907104
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Punk.TFT_Set10.tex",
            "name": "펑크"
          },
          {
            "apiName": "Set10_Dazzler",
            "desc": "현혹술사가 스킬 사용 시 대상의 피해량을 @DamageDecrease*100@% 감소시키고 @Duration@초 동안 추가 마법 피해를 입힙니다.<br><br><expandRow>(@MinUnits@) <magicDamage>@DOTPercent*100@%</magicDamage>의 마법 피해</expandRow>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "Duration": 2.0,
                  "{80cf3c31}": 0.20000000298023224,
                  "{bca0d684}": 0.10000000149011612
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 4,
                "variables": {
                  "Duration": 2.0,
                  "{80cf3c31}": 0.6000000238418579,
                  "{bca0d684}": 0.10000000149011612
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "Duration": 2.0,
                  "{80cf3c31}": 1.0,
                  "{bca0d684}": 0.10000000149011612
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_4_Dazzler.tex",
            "name": "현혹술사"
          },
          {
            "apiName": "Set10_PopBand",
            "desc": "적을 처치하면 하트를 획득합니다. 플레이어 대상 전투에서 패배하면 더 많이 얻습니다. 매 @RoundCount@번째 플레이어 대상 전투에서 하트가 강력한 보상으로 전환됩니다. <br><br><row>(@MinUnits@) 하트 획득 @PercentHeartRate@배</row><br><row>(@MinUnits@) 하트 획득 @PercentHeartRate@배</row><br><row>(@MinUnits@) 하트 획득 @PercentHeartRate@배</row><br><row>(@MinUnits@) 하트 획득량이 @PercentHeartRate@배가 됩니다. 라운드마다 보상을 획득하고 하트의 @HeartKeepPercentage*100@%를 유지합니다.</row>",
            "effects": [
              {
                "maxUnits": 4,
                "minUnits": 3,
                "style": 1,
                "variables": {
                  "{7e97c18b}": "null",
                  "{97244f72}": "null",
                  "{b91d171c}": 1.0
                }
              },
              {
                "maxUnits": 6,
                "minUnits": 5,
                "style": 3,
                "variables": {
                  "{7e97c18b}": "null",
                  "{97244f72}": "null",
                  "{b91d171c}": 2.25
                }
              },
              {
                "maxUnits": 9,
                "minUnits": 7,
                "style": 4,
                "variables": {
                  "{7e97c18b}": "null",
                  "{97244f72}": "null",
                  "{b91d171c}": 5.5
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 10,
                "style": 5,
                "variables": {
                  "{7e97c18b}": 1.0,
                  "{97244f72}": 0.800000011920929,
                  "{b91d171c}": 10.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Heartsteel.TFT_Set10.tex",
            "name": "Heartsteel"
          },
          {
            "apiName": "Set10_Brawler",
            "desc": "아군이 @TeamFlatHealth@의 체력을 얻습니다. 난동꾼은 추가 최대 체력을 얻습니다.<br><br><expandRow>(@MinUnits@) 최대 %i:scaleHealth%의 @BonusPercentHealth*100@%</expandRow>",
            "effects": [
              {
                "maxUnits": 3,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "BonusPercentHealth": 0.20000000298023224,
                  "TeamFlatHealth": 100.0
                }
              },
              {
                "maxUnits": 5,
                "minUnits": 4,
                "style": 3,
                "variables": {
                  "BonusPercentHealth": 0.44999998807907104,
                  "TeamFlatHealth": 100.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 6,
                "style": 4,
                "variables": {
                  "BonusPercentHealth": 0.8999999761581421,
                  "TeamFlatHealth": 100.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_3_Brawler.tex",
            "name": "난동꾼"
          },
          {
            "apiName": "Set10_Jazz",
            "desc": "활성화된 특성 하나당 아군이 추가 체력과 추가 피해량을 얻습니다. (고유 특성 제외)<br><br><expandRow>(@MinUnits@) @BonusHealth*100@% %i:scaleHealth%, 피해량 @BonusDamage*100@%</expandRow><br><br>추가 체력: @TFTUnitProperty.trait:TFT10_Trait_Jazz_TraitTracker_CurrentBonus@%<br>추가 피해량: @TFTUnitProperty.trait:TFT10_Trait_Jazz_TraitTracker_CurrentBonus_Damage@%",
            "effects": [
              {
                "maxUnits": 2,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "BonusDamage": 0.009999999776482582,
                  "BonusHealth": 0.014999999664723873
                }
              },
              {
                "maxUnits": 3,
                "minUnits": 3,
                "style": 3,
                "variables": {
                  "BonusDamage": 0.014999999664723873,
                  "BonusHealth": 0.02500000037252903
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 4,
                "style": 4,
                "variables": {
                  "BonusDamage": 0.019999999552965164,
                  "BonusHealth": 0.03999999910593033
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_Jazz.TFT_Set10.tex",
            "name": "재즈"
          },
          {
            "apiName": "Set10_EDM",
            "desc": "EDM 선택기를 사용해 EDM 챔피언을 선택하고 각 챔피언의 스킬 사용 빈도를 확인할 수 있습니다.<br><br>선택한 챔피언의 스킬 사용 빈도에 따라 아군 EDM 챔피언이 해당 스킬을 변경된 효과가 적용된 상태로 사용합니다.<br><br><row>(@MinUnits@) @EDMstats*100@%의 효과</row><br><row>(@MinUnits@) @EDMstats*100@%의 효과</row><br><row>(@MinUnits@) @EDMstats*100@%의 효과, -@EDMtimereduction@초</row><br><row>(@MinUnits@) @EDMstats*100@%의 효과, -@EDMtimereduction@초</row>",
            "effects": [
              {
                "maxUnits": 2,
                "minUnits": 2,
                "style": 1,
                "variables": {
                  "{50d03f4e}": 0.8999999761581421
                }
              },
              {
                "maxUnits": 3,
                "minUnits": 3,
                "style": 1,
                "variables": {
                  "{50d03f4e}": 1.0
                }
              },
              {
                "maxUnits": 4,
                "minUnits": 4,
                "style": 3,
                "variables": {
                  "{50d03f4e}": 1.100000023841858,
                  "{78f8ea27}": 1.0
                }
              },
              {
                "maxUnits": 25000,
                "minUnits": 5,
                "style": 4,
                "variables": {
                  "{50d03f4e}": 1.2999999523162842,
                  "{78f8ea27}": 1.0
                }
              }
            ],
            "icon": "ASSETS/UX/TraitIcons/Trait_Icon_10_EDM.TFT_Set10.tex",
            "name": "EDM"
          }
        ]
      };
      (map['data'] as List<Map<String , dynamic>>).forEach((element) {
        uploadTrait(element);
      });
    }catch(e){
      StaticLogger.logger.e(e);
    }
  }
  
  static Future<void> uploadAllItemList()async{
    try{

      await _uploadItemList(ItemJson.component , 'component');
      await _uploadItemList(ItemJson.completed , 'completed');
      await _uploadItemList(ItemJson.emblem , 'emblem');
      StaticLogger.logger.i("아이템 데이터 업로드 완료");
    }catch(e){
      StaticLogger.logger.e(e);
    }
  }

  static Future<void> _uploadItemList(Map<String , dynamic> map , String name)async{
    try{

      List<Map<String , dynamic>> itemList = map['data'] as List<Map<String , dynamic>>;

      await Future.wait(
          itemList.map((e) async =>
          await FirebaseFirestore.instance.collection('items').doc(name).collection('data').doc(e['apiName']).set(e)
          )
      );

      StaticLogger.logger.i("$name 데이터 업로드 완료");
    }catch(e){
      StaticLogger.logger.e(e);
    }
  }
}