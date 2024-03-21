class ItemJson{
  static Map<String , dynamic> data = {
    "component" : [
      {
        "apiName": "TFT_Item_FreeBFSword",
        "associatedTraits": [],
        "composition": [],
        "desc": "공격력 %i:scaleAD%+@AD*100@%",
        "effects": {
          "AD": 15.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Icon_BFSword.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "B.F. 대검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RecurveBow",
        "associatedTraits": [],
        "composition": [],
        "desc": "공격 속도 %i:scaleAS%+@AS@%",
        "effects": {
          "AS": 10.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Recurve_Bow.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "곡궁",
        "unique": false
      },
      {
        "apiName": "TFT_Item_ChainVest",
        "associatedTraits": [],
        "composition": [],
        "desc": "방어력 %i:scaleArmor% +@Armor@",
        "effects": {
          "Armor": 20.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Chain_Vest.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "쇠사슬 조끼",
        "unique": false
      },
      {
        "apiName": "TFT_Item_NegatronCloak",
        "associatedTraits": [],
        "composition": [],
        "desc": "마법 저항력 %i:scaleMR% +@MagicResist@",
        "effects": {
          "MagicResist": 20.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Negatron_Cloak.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "음전자 망토",
        "unique": false
      },
      {
        "apiName": "TFT_Item_NeedlesslyLargeRod",
        "associatedTraits": [],
        "composition": [],
        "desc": "주문력 %i:scaleAP% +@AP@",
        "effects": {
          "AP": 10.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Needlessly_Large_Rod.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "쓸데없이 큰 지팡이",
        "unique": false
      },
      {
        "apiName": "TFT_Item_TearOfTheGoddess",
        "associatedTraits": [],
        "composition": [],
        "desc": "마나 %i:scaleMana% +@Mana@",
        "effects": {
          "Mana": 15.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Tear_of_the_Goddess.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "여신의 눈물",
        "unique": false
      },
      {
        "apiName": "TFT_Item_GiantsBelt",
        "associatedTraits": [],
        "composition": [],
        "desc": "체력 %i:scaleHealth% +@Health@",
        "effects": {
          "Health": 150.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Gaints_Belt.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "거인의 허리띠",
        "unique": false
      },
      {
        "apiName": "TFT_Item_SparringGloves",
        "associatedTraits": [],
        "composition": [],
        "desc": "치명타 확률 +@CritChance@",
        "effects": {
          "CritChance": 20.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Sparring_Gloves.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "연습용 장갑",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Spatula",
        "associatedTraits": [],
        "composition": [],
        "desc": "<tftitemrules>무슨 쓸모가 있을 텐데...</tftitemrules>",
        "effects": {
          "{fe9818ef}": 5.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Spatula.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "뒤집개",
        "unique": false
      }
    ],
    "completed": [
      {
        "apiName": "TFT_Item_Deathblade",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_BFSword"
        ],
        "desc": "@BonusDamage*100@%의 추가 피해량",
        "effects": {
          "AD": 0.550000011920929,
          "BonusDamage": 0.07999999821186066
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Death_Blade.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "죽음의 검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_MadredsBloodrazor",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_RecurveBow"
        ],
        "desc": "최대 체력이 @HealthThreshold@ 이상인 적에게 피해량 @LargeBonusPct@% 증가",
        "effects": {
          "AD": 0.30000001192092896,
          "AP": 20,
          "AS": 10,
          "HealthThreshold": 1600,
          "LargeBonusPct": 25
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Giant_Slayer.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "거인 학살자",
        "unique": false
      },
      {
        "apiName": "TFT_Item_GuardianAngel",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_ChainVest"
        ],
        "desc": "전투당 1회: 체력이 @HealthThreshold@%일 때 잠시 대상으로 지정할 수 없게 되며 해로운 효과 제거. 이후 추가 공격 속도 @AttackSpeed@% 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AD": 0.10000000149011612,
          "Armor": 20,
          "AttackSpeed": 15,
          "DamageReduction": 100,
          "HealthThreshold": 60,
          "StealthDuration": 1
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Edge_Of_Night.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "밤의 끝자락",
        "unique": true
      },
      {
        "apiName": "TFT_Item_Bloodthirster",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "<TFTKeyword>모든 피해 흡혈</TFTKeyword> @Lifesteal@% 획득.<br><br>전투당 한 번, 체력이 @HealthThreshold@%일 때 최대 체력의 @ShieldHealthPercent@%에 해당하는 보호막 획득 후 최대 @ShieldDuration@초까지 유지<br><br><tftitemrules><tftbold>모든 피해 흡혈</tftbold>입힌 피해의 일부만큼 체력 회복</tftitemrules>",
        "effects": {
          "AD": 0.20000000298023224,
          "AP": 15,
          "HealthThreshold": 40,
          "LifeSteal": 20,
          "MagicResist": 20,
          "ShieldDuration": 5,
          "ShieldHealthPercent": 25
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Bloodthirster.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "피바라기",
        "unique": false
      },
      {
        "apiName": "TFT_Item_HextechGunblade",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_NeedlesslyLargeRod"
        ],
        "desc": "<TFTKeyword>모든 피해 흡혈</TFTKeyword> @OmniVamp@% 획득. 체력 비율이 가장 낮은 아군의 체력 회복<br><br><TFTTrackerLabel>체력 회복:</TFTTrackerLabel> <TFTHighlight>@TFTUnitProperty.item:TFT_Tracker_Value1@</TFTHighlight><br><br><tftitemrules><tftbold>모든 피해 흡혈</tftbold>: 입힌 피해의 일부만큼 체력 회복</tftitemrules>",
        "effects": {
          "AD": 0.15000000596046448,
          "AP": 15,
          "Omnivamp": 22
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Hextech_Gunblade.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "마법공학 총검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_SpearOfShojin",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "기본 공격 시 추가 마나 @FlatManaRestore@ 획득",
        "effects": {
          "AD": 0.20000000298023224,
          "AP": 20,
          "FlatManaRestore": 5,
          "Mana": 15
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Spear_of_Shojin.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "쇼진의 창",
        "unique": false
      },
      {
        "apiName": "TFT_Item_SteraksGage",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "전투당 한 번, 체력이 @HealthThreshold@%일 때 최대 체력 @BonusMaxHealthPerc@% 및 공격력 @BonusADToGive@% 증가",
        "effects": {
          "AD": 0.15000000596046448,
          "BonusADToGive": 35,
          "BonusMaxHealthPerc": 20,
          "Health": 200,
          "HealthThreshold": 60
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Steraks_Gage.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "스테락의 도전",
        "unique": false
      },
      {
        "apiName": "TFT_Item_InfinityEdge",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_SparringGloves"
        ],
        "desc": "스킬에 치명타 적용 가능<br><br>기본 스킬에 치명타 적용이 가능한 경우, 대신에 치명타 피해량이 @CritDamageToGive*100@% 증가",
        "effects": {
          "AD": 0.3499999940395355,
          "CritChance": 35,
          "{39abb260}": 0.10000000149011612
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Infinity_Edge.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "무한의 대검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RapidFireCannon",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_RecurveBow"
        ],
        "desc": "@BonusDamage*100@%의 추가 피해량<br><br>기본 공격과 스킬 사용 시 적에게 @Duration@초 동안 @BurnPercent@% <TFTKeyword>불태우기</TFTKeyword>와 @HealingReductionPct@% <TFTKeyword>상처</TFTKeyword> 적용<br><br><tftitemrules><tftbold>불태우기</tftbold>: 매초 대상 최대 체력의 일정 비율만큼 고정 피해<br><tftbold>상처</tftbold>: 체력 회복량 감소</tftitemrules>",
        "effects": {
          "AS": 40,
          "BonusDamage": 0.05999999865889549,
          "BurnPercent": 1,
          "Duration": 5,
          "HealingReductionPct": 33,
          "HexRangeIncrease": 1,
          "{9f5117db}": 100
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/RedBuff.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "붉은 덩굴정령",
        "unique": false
      },
      {
        "apiName": "TFT_Item_GuinsoosRageblade",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_NeedlesslyLargeRod"
        ],
        "desc": "공격 시 공격 속도가 @AttackSpeedPerStack@% 증가 (중첩 가능)",
        "effects": {
          "AP": 10,
          "AS": 15,
          "AttackSpeedPerStack": 5
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Guinsoos_Rageblade.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "구인수의 격노검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_StatikkShiv",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "3번째 기본 공격마다 적 @1StarBounces@명에게 @Damage@의 마법 피해를 입히고 @MRShredDuration@초 동안 @MRShred@% <TFTKeyword>파쇄</TFTKeyword><br><br><tftitemrules><tftbold>파쇄</tftbold>: 마법 저항력 감소</tftitemrules>",
        "effects": {
          "1StarBounces": 4,
          "AP": 15,
          "AS": 20,
          "Damage": 30,
          "MRShred": 30,
          "MRShredDuration": 5,
          "Mana": 15,
          "{12a15e9e}": 4,
          "{15144cec}": 4,
          "{79e2ec7b}": 4
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Statikk_Shiv.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "스태틱의 단검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Leviathan",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "스킬 사용 후 @ASDuration@초 동안 공격 속도 @AttackSpeedToGive@% 증가",
        "effects": {
          "AP": 30,
          "AS": 10,
          "ASDuration": 5,
          "AttackSpeedToGive": 40,
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Nashors_Tooth.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "내셔의 이빨",
        "unique": false
      },
      {
        "apiName": "TFT_Item_LastWhisper",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_SparringGloves"
        ],
        "desc": "물리 피해를 입힐 경우 @ArmorBreakDuration@초 동안 대상 @ArmorReductionPercent@% <TFTKeyword>파열</TFTKeyword> (중첩 불가)<br><br><tftitemrules>[고유 - 중복 적용 불가]<br><tftbold>파열</tftbold>: 방어력 감소</tftitemrules>",
        "effects": {
          "AD": 0.15000000596046448,
          "AS": 25,
          "ArmorBreakDuration": 3,
          "ArmorReductionPercent": 30,
          "CritChance": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Last_Whisper.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "최후의 속삭임",
        "unique": true
      },
      {
        "apiName": "TFT_Item_TitansResolve",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_RecurveBow"
        ],
        "desc": "공격하거나 피해를 받으면 공격력 @StackingAD*100@%, 주문력 @StackingAD*100@ 증가 (최대 @StackCap@회 중첩)  <br><br>최대 중첩 시 방어력 @BonusResistsAtStackCap@ 및 마법 저항력 @BonusResistsAtStackCap@ 획득",
        "effects": {
          "AS": 10,
          "Armor": 20,
          "BonusResistsAtStackCap": 20,
          "StackCap": 25,
          "StackingAD": 0.019999999552965164,
          "StackingSP": 2
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Titans_Resolve.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "거인의 결의",
        "unique": false
      },
      {
        "apiName": "TFT_Item_BrambleVest",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_ChainVest"
        ],
        "desc": "@PercentMaxHP*100@%의 최대 체력 획득<br><br>기본 공격으로 받는 피해 @AutoDamageReduction*100@% 감소. 기본 공격에 맞을 경우 인접한 모든 적에게 <magicDamage>@1StarAoEDamage@의 마법 피해</magicDamage><br><br><tftitemrules>재사용 대기시간: @ICD@초</tftitemrules>",
        "effects": {
          "1StarAoEDamage": 100,
          "2StarAoEDamage": 100,
          "3StarAoEDamage": 100,
          "Armor": 55,
          "ICD": 2,
          "{65fbd974}": 0.05000000074505806,
          "{6688a0d5}": 100,
          "{67cb638c}": 0.07999999821186066,
          "{b5c2a66b}": 100
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Bramble_Vest.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "덤불 조끼",
        "unique": false
      },
      {
        "apiName": "TFT_Item_GargoyleStoneplate",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "적의 공격 대상이 되면 방어력이 @ArmorPerEnemy@, 마법 저항력이 @MRPerEnemy@ 증가. 공격하는 적이 늘어나면 중첩되어 적용",
        "effects": {
          "Armor": 35,
          "ArmorPerEnemy": 10,
          "Health": 100,
          "MRPerEnemy": 10,
          "MagicResist": 35
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Gargoyle_Stoneplate.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "가고일 돌갑옷",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RedBuff",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "@ICD@초마다 @HexRange@칸 내에 있는 적 하나에게 @BurnDuration@초 동안 @BurnPercent@% <TFTKeyword>불태우기</TFTKeyword> 및 @GrievousWoundsPercent@% <TFTKeyword>상처</TFTKeyword> 적용<br><br><tftitemrules>[고유 - 중복 적용 불가]<br><tftbold>불태우기</tftbold>: 매초 대상 최대 체력의 일정 비율만큼 고정 피해<br><tftbold>상처</tftbold>: 체력 회복량 감소</tftitemrules>",
        "effects": {
          "Armor": 20,
          "BurnDuration": 10,
          "BurnPercent": 1,
          "GrievousWoundsPercent": 33,
          "Health": 250,
          "HexRange": 2,
          "ICD": 2,
          "MonsterCap": 100
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Sunfire_Cape.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "태양불꽃 망토",
        "unique": true
      },
      {
        "apiName": "TFT_Item_NightHarvester",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_SparringGloves"
        ],
        "desc": "받는 피해 @BaseDamageReduction@% 감소. 체력이 @ThresholdForEmpower*100@%보다 많을 때 받는 피해 @EmpowerDamageReduction@% 감소<br><br><TFTTrackerLabel>막은 피해량:</TFTTrackerLabel> <TFTHighlight>@TFTUnitProperty.item:TFT_Tracker_Value1@</TFTHighlight>",
        "effects": {
          "Armor": 20,
          "CritChance": 20,
          "Health": 250,
          "{18c66f5e}": 15,
          "{525a87ee}": 8,
          "{613b5452}": 0.5
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Behemoth.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "굳건한 심장",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RunaansHurricane",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NegatronCloak",
          "TFT_Item_RecurveBow"
        ],
        "desc": "기본 공격 시 주변 적 하나에게 탄환을 발사하여 공격력 %i:scaleAD%의 @MultiplierForDamage@%만큼 물리 피해",
        "effects": {
          "AD": 0.25,
          "AS": 10,
          "AdditionalTargets": 1,
          "MagicResist": 20,
          "MultiplierForDamage": 50
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Runaans_Hurricane.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "루난의 허리케인",
        "unique": false
      },
      {
        "apiName": "TFT_Item_DragonsClaw",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NegatronCloak",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "@PercentMaxHP*100@%의 최대 체력 획득<br><br>@HealthRegenInterval@초마다 최대 체력의 @PercentHealthDamage@% 회복",
        "effects": {
          "HealthRegenInterval": 2,
          "ICD": 0.5,
          "MagicResist": 55,
          "PercentHealthDamage": 5,
          "{65fbd974}": 0.10000000149011612
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Dragons_Claw.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "용의 발톱",
        "unique": false
      },
      {
        "apiName": "TFT_Item_AdaptiveHelm",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NegatronCloak",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "전투 시작: 시작 위치에 따라 추가 효과 획득<br><br>전방 2열: 방어력과 마법 저항력 @FrontRowBonusResists@. 기본 공격에 맞으면 마나 @FrontLineManaPerHit@ 획득<br><br>후방 2열: 주문력 @BackRowBonusAP@. @ManaTickrate@초마다 마나 @ManaPerTickrate@ 획득<br>",
        "effects": {
          "AP": 15,
          "BackRowBonusAP": 20,
          "FrontRowBonusResists": 40,
          "MagicResist": 20,
          "Mana": 15,
          "ManaPerTickrate": 10,
          "ManaTickrate": 3,
          "{76459d11}": 1,
          "{d357c9f2}": "null"
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Adaptive_Helm.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "적응형 투구",
        "unique": false
      },
      {
        "apiName": "TFT_Item_SpectralGauntlet",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NegatronCloak",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "@HexRange@칸 내에 있는 적 @ARReductionAmount@% <TFTKeyword>파열</TFTKeyword> 전투 시작 후 @BonusResistDuration@초 동안 방어력과 마법 저항력 @BonusResists@ 증가<br><br><tftitemrules><tftbold>파열</tftbold>: 방어력 감소</tftitemrules>",
        "effects": {
          "ARReductionAmount": 30,
          "BonusResistDuration": 10,
          "BonusResists": 25,
          "Health": 150,
          "HexRange": 2,
          "MagicResist": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Evenshroud.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "저녁갑주",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Crownguard",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_ChainVest"
        ],
        "desc": "전투 시작: @ShieldDuration@초 동안 최대 체력의 @ShieldSize@%에 해당하는 보호막 획득<br>보호막이 사라지면 주문력 @ShieldBonusAP@ 증가<br>",
        "effects": {
          "AP": 20,
          "Armor": 20,
          "Health": 100,
          "HexRange": 2,
          "ShieldBonusAP": 35,
          "ShieldDuration": 8,
          "ShieldSize": 30,
          "{9b5d330d}": 4
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Crownguard.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "크라운가드",
        "unique": false
      },
      {
        "apiName": "TFT_Item_IonicSpark",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "@HexRange@칸 내에 있는 모든 적 <TFTKeyword>파쇄</TFTKeyword> @MRShred@%. 해당 적이 스킬 사용 시 최대 마나의 @ManaRatio@%에 해당하는 마법 피해를 입음<br><br><tftitemrules><tftbold>파쇄</tftbold>: 마법 저항력 감소</tftitemrules>",
        "effects": {
          "AP": 15,
          "Damage": 250,
          "Health": 200,
          "HexRange": 2,
          "MRShred": 30,
          "MagicResist": 25,
          "ManaRatio": 160
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Ionic_Spark.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "이온 충격기",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RabadonsDeathcap",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_NeedlesslyLargeRod"
        ],
        "desc": "@BonusDamage*100@%의 추가 피해량",
        "effects": {
          "AP": 50,
          "BonusDamage": 0.20000000298023224
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Rabadons_Deathcap.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "라바돈의 죽음모자",
        "unique": false
      },
      {
        "apiName": "TFT_Item_ArchangelsStaff",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "전투 시작: 전투 중 @IntervalSeconds@초마다 주문력 @APPerInterval@ 증가",
        "effects": {
          "AP": 20,
          "APPerInterval": 30,
          "IntervalSeconds": 5,
          "Mana": 15
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Archangel_Staff.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "대천사의 지팡이",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Morellonomicon",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "기본 공격과 스킬 피해를 입힐 경우 대상에게 @BurnDuration@초 동안 @BurnPercent@% <TFTKeyword>불태우기</TFTKeyword> 및 @GrievousWoundsPercent@% <TFTKeyword>상처</TFTKeyword> 적용<br><br><tftitemrules>[고유 - 중복 적용 불가]<br><tftbold>불태우기</tftbold>: 매초 대상 최대 체력의 일정 비율만큼 고정 피해<br><tftbold>상처</tftbold>: 체력 회복량 감소</tftitemrules>",
        "effects": {
          "AP": 25,
          "AS": 15,
          "BurnDuration": 10,
          "BurnPercent": 1,
          "GrievousWoundsPercent": 33,
          "Health": 150,
          "MonsterCap": 100,
          "TicksPerSecond": 1
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Morellonomicon.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "모렐로노미콘",
        "unique": true
      },
      {
        "apiName": "TFT_Item_JeweledGauntlet",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_SparringGloves"
        ],
        "desc": "스킬에 치명타 적용 가능<br><br>기본 스킬에 치명타 적용이 가능한 경우, 대신에 치명타 피해량이 @CritDamageToGive*100@% 증가",
        "effects": {
          "AP": 35,
          "CritChance": 35,
          "{39abb260}": 0.10000000149011612
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Jeweled_Guantlet.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "보석 건틀릿",
        "unique": false
      },
      {
        "apiName": "TFT_Item_FrozenHeart",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_TearOfTheGoddess",
          "TFT_Item_ChainVest"
        ],
        "desc": "전투당 한 번, 체력이 @HealthThreshold@%일 때 최대 체력의 @ShieldHealthPercent@%에 해당하는 보호막 획득 후 @ShieldDuration@초 동안 유지. 동시에 방어력 @Stats@, 마법 저항력 @Stats@ 획득",
        "effects": {
          "Armor": 20,
          "HealthThreshold": 40,
          "Mana": 30,
          "ShieldDuration": 5,
          "ShieldHealthPercent": 25,
          "Stats": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Winters_Approach.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "수호자의 맹세",
        "unique": false
      },
      {
        "apiName": "TFT_Item_BlueBuff",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_TearOfTheGoddess",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "최대 마나 @ManaReduction@ 감소 <br><br>장착한 유닛이 처치 관여 시 @TakedownTimer@초 동안 @DamageAmp*100@%의 추가 피해<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AD": 0.20000000298023224,
          "AP": 20,
          "DamageAmp": 0.07999999821186066,
          "Mana": 20,
          "ManaReduction": 10,
          "TakedownTimer": 8
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Blue_Buff.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "푸른 파수꾼",
        "unique": true
      },
      {
        "apiName": "TFT_Item_Redemption",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_TearOfTheGoddess",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "@HealTickRate@초마다 1칸 내에 있는 아군의 체력을 대상이 잃은 체력의 @MissingHealthHeal@%만큼 회복. 또한 효과를 받은 아군은 @HealTickRate@초 동안 공격으로 입는 피해량이 @AoEDamageReduction@% 감소 (피해량 감소는 중첩되지 않음)<br><br><TFTTrackerLabel>체력 회복:</TFTTrackerLabel> <TFTHighlight>@TFTUnitProperty.item:TFT_Tracker_Value1@</TFTHighlight>",
        "effects": {
          "AoEDamageReduction": 10,
          "HealTickRate": 5,
          "Health": 150,
          "HexRadius": 1,
          "Mana": 15,
          "MaxHeal": 1000,
          "MissingHealthHeal": 15
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Redemption.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "구원",
        "unique": false
      },
      {
        "apiName": "TFT_Item_UnstableConcoction",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_TearOfTheGoddess",
          "TFT_Item_SparringGloves"
        ],
        "desc": "2가지 효과 획득:<li>공격력 @BaseAD*100@%, 주문력 @BaseSP@<li><TFTKeyword>모든 피해 흡혈</TFTKeyword> @BaseHeal@%<br><br>라운드마다 위 효과 중 1개 무작위로 두 배 증가<br><br><tftitemrules><tftbold>모든 피해 흡혈</tftbold>: 입힌 피해의 일부만큼 체력 회복</tftitemrules>",
        "effects": {
          "BaseAD": 0.15000000596046448,
          "BaseHeal": 15,
          "BaseSP": 15,
          "BonusSP": 15,
          "CritChance": 20,
          "Mana": 15,
          "{693a77ae}": 0.15000000596046448,
          "{a60806db}": 66.66699981689453
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Hand_of_Justice.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "정의의 손길",
        "unique": false
      },
      {
        "apiName": "TFT_Item_WarmogsArmor",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_GiantsBelt",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "@BonusPercentHP*100@%의 최대 체력 획득",
        "effects": {
          "Health": 600,
          "{dd270afd}": 0.07999999821186066
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Warmogs_Armor.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "워모그의 갑옷",
        "unique": false
      },
      {
        "apiName": "TFT_Item_PowerGauntlet",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_GiantsBelt",
          "TFT_Item_SparringGloves"
        ],
        "desc": "보호막 공격 후 @Duration@초 동안 피해량 @DamageAmpPct@% 증가",
        "effects": {
          "AP": 10,
          "AS": 20,
          "CritChance": 20,
          "DamageAmpPct": 25,
          "Duration": 3,
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Stridebreaker.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "방패파괴자",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Quicksilver",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_SparringGloves",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "전투 시작: @SpellShieldDuration@초 동안 군중 제어 효과에 면역. 이 동안 @ProcInterval@초마다 @ProcAttackSpeed*100@%의 공격 속도 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AS": 30,
          "CritChance": 20,
          "MagicResist": 20,
          "SpellShieldDuration": 14,
          "{530a7d84}": 0.03999999910593033,
          "{d1b54a6c}": 2
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Quicksilver.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "수은",
        "unique": true
      },
      {
        "apiName": "TFT_Item_ThiefsGloves",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_SparringGloves",
          "TFT_Item_SparringGloves"
        ],
        "desc": "매 라운드: 무작위 아이템 2개 장착<br><br><tftitemrules>[아이템 슬롯 3개 소모.]</tftitemrules>",
        "effects": {
          "CritChance": 20,
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Thieves_Gloves.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "도적의 장갑",
        "unique": false
      },
      {
        "apiName": "TFT_Item_ForceOfNature",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_Spatula"
        ],
        "desc": "아군의 최대 팀 규모 +@MaxArmySizeIncrease@ 증가",
        "effects": {
          "MaxArmySizeIncrease": 1
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Tacticians_Crown.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "전략가의 왕관",
        "unique": false
      }
    ],
    "emblem": [
      {
        "apiName": "TFT11_Item_StoryweaverEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_ChainVest"
        ],
        "desc": "장착 시 이야기꾼 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Armor": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Skyweaver.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Storyweaver"
        ],
        "name": "이야기꾼 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_DryadEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "장착 시 숲지기 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Dryad.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Dryad"
        ],
        "name": "숲지기 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_UmbralEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_SparringGloves"
        ],
        "desc": "장착 시 암영 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "CritChance": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Umbral.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Umbral"
        ],
        "name": "암영 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_FatedEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_NeedlesslyLargeRod"
        ],
        "desc": "장착 시 필연 특성 획득<br><br>필연 추가 효과: @ProcRate@초마다 <keyword>@HPRegen*100@%</keyword>의 체력을 회복합니다.<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AP": 10,
          "HPRegen": 0.029999999329447746,
          "ProcRate": 3
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Fated.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Fated"
        ],
        "name": "필연 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_HeavenlyEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "장착 시 천계 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "MagicResist": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Heavenly.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Heavenly"
        ],
        "name": "천계 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_MythicEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "장착 시 신화 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Mana": 15
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Mythic.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Mythic"
        ],
        "name": "신화 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_GhostlyEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_Spatula"
        ],
        "desc": "장착 시 혼령 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AD": 0.10000000149011612
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Ghostly.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Ghostly"
        ],
        "name": "혼령 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_PorcelainEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_RecurveBow"
        ],
        "desc": "장착 시 도자기 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AS": 10
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Porcelain.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Porcelain"
        ],
        "name": "도자기 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_ReaperEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 사신 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Reaper.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Reaper"
        ],
        "name": "사신 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_SageEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 현자 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Sage.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Sage"
        ],
        "name": "현자 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_DragonlordEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 용군주 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Dragonlord.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Dragonlord"
        ],
        "name": "용군주 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_SniperEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 저격수 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Sniper.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Sniper"
        ],
        "name": "저격수 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_ChallengerEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 결투가 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Duelist.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Duelist"
        ],
        "name": "결투가 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_BehemothEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 거대 괴수 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Behemoth.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Behemoth"
        ],
        "name": "거대 괴수 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_InvokerEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 기원자 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Invoker.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Invoker"
        ],
        "name": "기원자 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_BruiserEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 난동꾼 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Bruiser.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Bruiser"
        ],
        "name": "난동꾼 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_FortuneEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 행운 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Fortune.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Fortune"
        ],
        "name": "행운 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_InkShadowEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 먹그림자 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_InkShadow.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_InkShadow"
        ],
        "name": "먹그림자 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_WardenEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 파수꾼 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Warden.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Warden"
        ],
        "name": "파수꾼 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_SpellslingerEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 비전 마법사 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Arcanist.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Arcanist"
        ],
        "name": "비전 마법사 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_AltruistEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 이타심 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Altruist.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Altruist"
        ],
        "name": "이타심 상징",
        "unique": true
      }
    ]
  };

  static Map<String , dynamic> component = {
    'data' : [
      {
        "apiName": "TFT_Item_FreeBFSword",
        "associatedTraits": [],
        "composition": [],
        "desc": "공격력 %i:scaleAD%+@AD*100@%",
        "effects": {
          "AD": 15.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Icon_BFSword.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "B.F. 대검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RecurveBow",
        "associatedTraits": [],
        "composition": [],
        "desc": "공격 속도 %i:scaleAS%+@AS@%",
        "effects": {
          "AS": 10.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Recurve_Bow.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "곡궁",
        "unique": false
      },
      {
        "apiName": "TFT_Item_ChainVest",
        "associatedTraits": [],
        "composition": [],
        "desc": "방어력 %i:scaleArmor% +@Armor@",
        "effects": {
          "Armor": 20.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Chain_Vest.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "쇠사슬 조끼",
        "unique": false
      },
      {
        "apiName": "TFT_Item_NegatronCloak",
        "associatedTraits": [],
        "composition": [],
        "desc": "마법 저항력 %i:scaleMR% +@MagicResist@",
        "effects": {
          "MagicResist": 20.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Negatron_Cloak.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "음전자 망토",
        "unique": false
      },
      {
        "apiName": "TFT_Item_NeedlesslyLargeRod",
        "associatedTraits": [],
        "composition": [],
        "desc": "주문력 %i:scaleAP% +@AP@",
        "effects": {
          "AP": 10.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Needlessly_Large_Rod.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "쓸데없이 큰 지팡이",
        "unique": false
      },
      {
        "apiName": "TFT_Item_TearOfTheGoddess",
        "associatedTraits": [],
        "composition": [],
        "desc": "마나 %i:scaleMana% +@Mana@",
        "effects": {
          "Mana": 15.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Tear_of_the_Goddess.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "여신의 눈물",
        "unique": false
      },
      {
        "apiName": "TFT_Item_GiantsBelt",
        "associatedTraits": [],
        "composition": [],
        "desc": "체력 %i:scaleHealth% +@Health@",
        "effects": {
          "Health": 150.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Gaints_Belt.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "거인의 허리띠",
        "unique": false
      },
      {
        "apiName": "TFT_Item_SparringGloves",
        "associatedTraits": [],
        "composition": [],
        "desc": "치명타 확률 +@CritChance@",
        "effects": {
          "CritChance": 20.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Sparring_Gloves.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "연습용 장갑",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Spatula",
        "associatedTraits": [],
        "composition": [],
        "desc": "<tftitemrules>무슨 쓸모가 있을 텐데...</tftitemrules>",
        "effects": {
          "{fe9818ef}": 5.0
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Spatula.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "뒤집개",
        "unique": false
      }
    ]
  };

  static Map<String , dynamic> completed = {
    "data": [
      {
        "apiName": "TFT_Item_Deathblade",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_BFSword"
        ],
        "desc": "@BonusDamage*100@%의 추가 피해량",
        "effects": {
          "AD": 0.550000011920929,
          "BonusDamage": 0.07999999821186066
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Death_Blade.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "죽음의 검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_MadredsBloodrazor",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_RecurveBow"
        ],
        "desc": "최대 체력이 @HealthThreshold@ 이상인 적에게 피해량 @LargeBonusPct@% 증가",
        "effects": {
          "AD": 0.30000001192092896,
          "AP": 20,
          "AS": 10,
          "HealthThreshold": 1600,
          "LargeBonusPct": 25
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Giant_Slayer.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "거인 학살자",
        "unique": false
      },
      {
        "apiName": "TFT_Item_GuardianAngel",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_ChainVest"
        ],
        "desc": "전투당 1회: 체력이 @HealthThreshold@%일 때 잠시 대상으로 지정할 수 없게 되며 해로운 효과 제거. 이후 추가 공격 속도 @AttackSpeed@% 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AD": 0.10000000149011612,
          "Armor": 20,
          "AttackSpeed": 15,
          "DamageReduction": 100,
          "HealthThreshold": 60,
          "StealthDuration": 1
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Edge_Of_Night.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "밤의 끝자락",
        "unique": true
      },
      {
        "apiName": "TFT_Item_Bloodthirster",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "<TFTKeyword>모든 피해 흡혈</TFTKeyword> @Lifesteal@% 획득.<br><br>전투당 한 번, 체력이 @HealthThreshold@%일 때 최대 체력의 @ShieldHealthPercent@%에 해당하는 보호막 획득 후 최대 @ShieldDuration@초까지 유지<br><br><tftitemrules><tftbold>모든 피해 흡혈</tftbold>입힌 피해의 일부만큼 체력 회복</tftitemrules>",
        "effects": {
          "AD": 0.20000000298023224,
          "AP": 15,
          "HealthThreshold": 40,
          "LifeSteal": 20,
          "MagicResist": 20,
          "ShieldDuration": 5,
          "ShieldHealthPercent": 25
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Bloodthirster.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "피바라기",
        "unique": false
      },
      {
        "apiName": "TFT_Item_HextechGunblade",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_NeedlesslyLargeRod"
        ],
        "desc": "<TFTKeyword>모든 피해 흡혈</TFTKeyword> @OmniVamp@% 획득. 체력 비율이 가장 낮은 아군의 체력 회복<br><br><TFTTrackerLabel>체력 회복:</TFTTrackerLabel> <TFTHighlight>@TFTUnitProperty.item:TFT_Tracker_Value1@</TFTHighlight><br><br><tftitemrules><tftbold>모든 피해 흡혈</tftbold>: 입힌 피해의 일부만큼 체력 회복</tftitemrules>",
        "effects": {
          "AD": 0.15000000596046448,
          "AP": 15,
          "Omnivamp": 22
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Hextech_Gunblade.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "마법공학 총검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_SpearOfShojin",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "기본 공격 시 추가 마나 @FlatManaRestore@ 획득",
        "effects": {
          "AD": 0.20000000298023224,
          "AP": 20,
          "FlatManaRestore": 5,
          "Mana": 15
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Spear_of_Shojin.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "쇼진의 창",
        "unique": false
      },
      {
        "apiName": "TFT_Item_SteraksGage",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "전투당 한 번, 체력이 @HealthThreshold@%일 때 최대 체력 @BonusMaxHealthPerc@% 및 공격력 @BonusADToGive@% 증가",
        "effects": {
          "AD": 0.15000000596046448,
          "BonusADToGive": 35,
          "BonusMaxHealthPerc": 20,
          "Health": 200,
          "HealthThreshold": 60
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Steraks_Gage.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "스테락의 도전",
        "unique": false
      },
      {
        "apiName": "TFT_Item_InfinityEdge",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_SparringGloves"
        ],
        "desc": "스킬에 치명타 적용 가능<br><br>기본 스킬에 치명타 적용이 가능한 경우, 대신에 치명타 피해량이 @CritDamageToGive*100@% 증가",
        "effects": {
          "AD": 0.3499999940395355,
          "CritChance": 35,
          "{39abb260}": 0.10000000149011612
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Infinity_Edge.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "무한의 대검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RapidFireCannon",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_RecurveBow"
        ],
        "desc": "@BonusDamage*100@%의 추가 피해량<br><br>기본 공격과 스킬 사용 시 적에게 @Duration@초 동안 @BurnPercent@% <TFTKeyword>불태우기</TFTKeyword>와 @HealingReductionPct@% <TFTKeyword>상처</TFTKeyword> 적용<br><br><tftitemrules><tftbold>불태우기</tftbold>: 매초 대상 최대 체력의 일정 비율만큼 고정 피해<br><tftbold>상처</tftbold>: 체력 회복량 감소</tftitemrules>",
        "effects": {
          "AS": 40,
          "BonusDamage": 0.05999999865889549,
          "BurnPercent": 1,
          "Duration": 5,
          "HealingReductionPct": 33,
          "HexRangeIncrease": 1,
          "{9f5117db}": 100
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/RedBuff.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "붉은 덩굴정령",
        "unique": false
      },
      {
        "apiName": "TFT_Item_GuinsoosRageblade",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_NeedlesslyLargeRod"
        ],
        "desc": "공격 시 공격 속도가 @AttackSpeedPerStack@% 증가 (중첩 가능)",
        "effects": {
          "AP": 10,
          "AS": 15,
          "AttackSpeedPerStack": 5
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Guinsoos_Rageblade.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "구인수의 격노검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_StatikkShiv",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "3번째 기본 공격마다 적 @1StarBounces@명에게 @Damage@의 마법 피해를 입히고 @MRShredDuration@초 동안 @MRShred@% <TFTKeyword>파쇄</TFTKeyword><br><br><tftitemrules><tftbold>파쇄</tftbold>: 마법 저항력 감소</tftitemrules>",
        "effects": {
          "1StarBounces": 4,
          "AP": 15,
          "AS": 20,
          "Damage": 30,
          "MRShred": 30,
          "MRShredDuration": 5,
          "Mana": 15,
          "{12a15e9e}": 4,
          "{15144cec}": 4,
          "{79e2ec7b}": 4
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Statikk_Shiv.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "스태틱의 단검",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Leviathan",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "스킬 사용 후 @ASDuration@초 동안 공격 속도 @AttackSpeedToGive@% 증가",
        "effects": {
          "AP": 30,
          "AS": 10,
          "ASDuration": 5,
          "AttackSpeedToGive": 40,
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Nashors_Tooth.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "내셔의 이빨",
        "unique": false
      },
      {
        "apiName": "TFT_Item_LastWhisper",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_RecurveBow",
          "TFT_Item_SparringGloves"
        ],
        "desc": "물리 피해를 입힐 경우 @ArmorBreakDuration@초 동안 대상 @ArmorReductionPercent@% <TFTKeyword>파열</TFTKeyword> (중첩 불가)<br><br><tftitemrules>[고유 - 중복 적용 불가]<br><tftbold>파열</tftbold>: 방어력 감소</tftitemrules>",
        "effects": {
          "AD": 0.15000000596046448,
          "AS": 25,
          "ArmorBreakDuration": 3,
          "ArmorReductionPercent": 30,
          "CritChance": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Last_Whisper.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "최후의 속삭임",
        "unique": true
      },
      {
        "apiName": "TFT_Item_TitansResolve",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_RecurveBow"
        ],
        "desc": "공격하거나 피해를 받으면 공격력 @StackingAD*100@%, 주문력 @StackingAD*100@ 증가 (최대 @StackCap@회 중첩)  <br><br>최대 중첩 시 방어력 @BonusResistsAtStackCap@ 및 마법 저항력 @BonusResistsAtStackCap@ 획득",
        "effects": {
          "AS": 10,
          "Armor": 20,
          "BonusResistsAtStackCap": 20,
          "StackCap": 25,
          "StackingAD": 0.019999999552965164,
          "StackingSP": 2
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Titans_Resolve.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "거인의 결의",
        "unique": false
      },
      {
        "apiName": "TFT_Item_BrambleVest",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_ChainVest"
        ],
        "desc": "@PercentMaxHP*100@%의 최대 체력 획득<br><br>기본 공격으로 받는 피해 @AutoDamageReduction*100@% 감소. 기본 공격에 맞을 경우 인접한 모든 적에게 <magicDamage>@1StarAoEDamage@의 마법 피해</magicDamage><br><br><tftitemrules>재사용 대기시간: @ICD@초</tftitemrules>",
        "effects": {
          "1StarAoEDamage": 100,
          "2StarAoEDamage": 100,
          "3StarAoEDamage": 100,
          "Armor": 55,
          "ICD": 2,
          "{65fbd974}": 0.05000000074505806,
          "{6688a0d5}": 100,
          "{67cb638c}": 0.07999999821186066,
          "{b5c2a66b}": 100
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Bramble_Vest.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "덤불 조끼",
        "unique": false
      },
      {
        "apiName": "TFT_Item_GargoyleStoneplate",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "적의 공격 대상이 되면 방어력이 @ArmorPerEnemy@, 마법 저항력이 @MRPerEnemy@ 증가. 공격하는 적이 늘어나면 중첩되어 적용",
        "effects": {
          "Armor": 35,
          "ArmorPerEnemy": 10,
          "Health": 100,
          "MRPerEnemy": 10,
          "MagicResist": 35
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Gargoyle_Stoneplate.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "가고일 돌갑옷",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RedBuff",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "@ICD@초마다 @HexRange@칸 내에 있는 적 하나에게 @BurnDuration@초 동안 @BurnPercent@% <TFTKeyword>불태우기</TFTKeyword> 및 @GrievousWoundsPercent@% <TFTKeyword>상처</TFTKeyword> 적용<br><br><tftitemrules>[고유 - 중복 적용 불가]<br><tftbold>불태우기</tftbold>: 매초 대상 최대 체력의 일정 비율만큼 고정 피해<br><tftbold>상처</tftbold>: 체력 회복량 감소</tftitemrules>",
        "effects": {
          "Armor": 20,
          "BurnDuration": 10,
          "BurnPercent": 1,
          "GrievousWoundsPercent": 33,
          "Health": 250,
          "HexRange": 2,
          "ICD": 2,
          "MonsterCap": 100
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Sunfire_Cape.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "태양불꽃 망토",
        "unique": true
      },
      {
        "apiName": "TFT_Item_NightHarvester",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_ChainVest",
          "TFT_Item_SparringGloves"
        ],
        "desc": "받는 피해 @BaseDamageReduction@% 감소. 체력이 @ThresholdForEmpower*100@%보다 많을 때 받는 피해 @EmpowerDamageReduction@% 감소<br><br><TFTTrackerLabel>막은 피해량:</TFTTrackerLabel> <TFTHighlight>@TFTUnitProperty.item:TFT_Tracker_Value1@</TFTHighlight>",
        "effects": {
          "Armor": 20,
          "CritChance": 20,
          "Health": 250,
          "{18c66f5e}": 15,
          "{525a87ee}": 8,
          "{613b5452}": 0.5
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Behemoth.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "굳건한 심장",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RunaansHurricane",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NegatronCloak",
          "TFT_Item_RecurveBow"
        ],
        "desc": "기본 공격 시 주변 적 하나에게 탄환을 발사하여 공격력 %i:scaleAD%의 @MultiplierForDamage@%만큼 물리 피해",
        "effects": {
          "AD": 0.25,
          "AS": 10,
          "AdditionalTargets": 1,
          "MagicResist": 20,
          "MultiplierForDamage": 50
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Runaans_Hurricane.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "루난의 허리케인",
        "unique": false
      },
      {
        "apiName": "TFT_Item_DragonsClaw",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NegatronCloak",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "@PercentMaxHP*100@%의 최대 체력 획득<br><br>@HealthRegenInterval@초마다 최대 체력의 @PercentHealthDamage@% 회복",
        "effects": {
          "HealthRegenInterval": 2,
          "ICD": 0.5,
          "MagicResist": 55,
          "PercentHealthDamage": 5,
          "{65fbd974}": 0.10000000149011612
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Dragons_Claw.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "용의 발톱",
        "unique": false
      },
      {
        "apiName": "TFT_Item_AdaptiveHelm",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NegatronCloak",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "전투 시작: 시작 위치에 따라 추가 효과 획득<br><br>전방 2열: 방어력과 마법 저항력 @FrontRowBonusResists@. 기본 공격에 맞으면 마나 @FrontLineManaPerHit@ 획득<br><br>후방 2열: 주문력 @BackRowBonusAP@. @ManaTickrate@초마다 마나 @ManaPerTickrate@ 획득<br>",
        "effects": {
          "AP": 15,
          "BackRowBonusAP": 20,
          "FrontRowBonusResists": 40,
          "MagicResist": 20,
          "Mana": 15,
          "ManaPerTickrate": 10,
          "ManaTickrate": 3,
          "{76459d11}": 1,
          "{d357c9f2}": "null"
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Adaptive_Helm.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "적응형 투구",
        "unique": false
      },
      {
        "apiName": "TFT_Item_SpectralGauntlet",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NegatronCloak",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "@HexRange@칸 내에 있는 적 @ARReductionAmount@% <TFTKeyword>파열</TFTKeyword> 전투 시작 후 @BonusResistDuration@초 동안 방어력과 마법 저항력 @BonusResists@ 증가<br><br><tftitemrules><tftbold>파열</tftbold>: 방어력 감소</tftitemrules>",
        "effects": {
          "ARReductionAmount": 30,
          "BonusResistDuration": 10,
          "BonusResists": 25,
          "Health": 150,
          "HexRange": 2,
          "MagicResist": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Evenshroud.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "저녁갑주",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Crownguard",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_ChainVest"
        ],
        "desc": "전투 시작: @ShieldDuration@초 동안 최대 체력의 @ShieldSize@%에 해당하는 보호막 획득<br>보호막이 사라지면 주문력 @ShieldBonusAP@ 증가<br>",
        "effects": {
          "AP": 20,
          "Armor": 20,
          "Health": 100,
          "HexRange": 2,
          "ShieldBonusAP": 35,
          "ShieldDuration": 8,
          "ShieldSize": 30,
          "{9b5d330d}": 4
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Crownguard.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "크라운가드",
        "unique": false
      },
      {
        "apiName": "TFT_Item_IonicSpark",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "@HexRange@칸 내에 있는 모든 적 <TFTKeyword>파쇄</TFTKeyword> @MRShred@%. 해당 적이 스킬 사용 시 최대 마나의 @ManaRatio@%에 해당하는 마법 피해를 입음<br><br><tftitemrules><tftbold>파쇄</tftbold>: 마법 저항력 감소</tftitemrules>",
        "effects": {
          "AP": 15,
          "Damage": 250,
          "Health": 200,
          "HexRange": 2,
          "MRShred": 30,
          "MagicResist": 25,
          "ManaRatio": 160
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Ionic_Spark.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "이온 충격기",
        "unique": false
      },
      {
        "apiName": "TFT_Item_RabadonsDeathcap",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_NeedlesslyLargeRod"
        ],
        "desc": "@BonusDamage*100@%의 추가 피해량",
        "effects": {
          "AP": 50,
          "BonusDamage": 0.20000000298023224
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Rabadons_Deathcap.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "라바돈의 죽음모자",
        "unique": false
      },
      {
        "apiName": "TFT_Item_ArchangelsStaff",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "전투 시작: 전투 중 @IntervalSeconds@초마다 주문력 @APPerInterval@ 증가",
        "effects": {
          "AP": 20,
          "APPerInterval": 30,
          "IntervalSeconds": 5,
          "Mana": 15
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Archangel_Staff.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "대천사의 지팡이",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Morellonomicon",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "기본 공격과 스킬 피해를 입힐 경우 대상에게 @BurnDuration@초 동안 @BurnPercent@% <TFTKeyword>불태우기</TFTKeyword> 및 @GrievousWoundsPercent@% <TFTKeyword>상처</TFTKeyword> 적용<br><br><tftitemrules>[고유 - 중복 적용 불가]<br><tftbold>불태우기</tftbold>: 매초 대상 최대 체력의 일정 비율만큼 고정 피해<br><tftbold>상처</tftbold>: 체력 회복량 감소</tftitemrules>",
        "effects": {
          "AP": 25,
          "AS": 15,
          "BurnDuration": 10,
          "BurnPercent": 1,
          "GrievousWoundsPercent": 33,
          "Health": 150,
          "MonsterCap": 100,
          "TicksPerSecond": 1
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Morellonomicon.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "모렐로노미콘",
        "unique": true
      },
      {
        "apiName": "TFT_Item_JeweledGauntlet",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_NeedlesslyLargeRod",
          "TFT_Item_SparringGloves"
        ],
        "desc": "스킬에 치명타 적용 가능<br><br>기본 스킬에 치명타 적용이 가능한 경우, 대신에 치명타 피해량이 @CritDamageToGive*100@% 증가",
        "effects": {
          "AP": 35,
          "CritChance": 35,
          "{39abb260}": 0.10000000149011612
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Jeweled_Guantlet.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "보석 건틀릿",
        "unique": false
      },
      {
        "apiName": "TFT_Item_FrozenHeart",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_TearOfTheGoddess",
          "TFT_Item_ChainVest"
        ],
        "desc": "전투당 한 번, 체력이 @HealthThreshold@%일 때 최대 체력의 @ShieldHealthPercent@%에 해당하는 보호막 획득 후 @ShieldDuration@초 동안 유지. 동시에 방어력 @Stats@, 마법 저항력 @Stats@ 획득",
        "effects": {
          "Armor": 20,
          "HealthThreshold": 40,
          "Mana": 30,
          "ShieldDuration": 5,
          "ShieldHealthPercent": 25,
          "Stats": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Winters_Approach.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "수호자의 맹세",
        "unique": false
      },
      {
        "apiName": "TFT_Item_BlueBuff",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_TearOfTheGoddess",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "최대 마나 @ManaReduction@ 감소 <br><br>장착한 유닛이 처치 관여 시 @TakedownTimer@초 동안 @DamageAmp*100@%의 추가 피해<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AD": 0.20000000298023224,
          "AP": 20,
          "DamageAmp": 0.07999999821186066,
          "Mana": 20,
          "ManaReduction": 10,
          "TakedownTimer": 8
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Blue_Buff.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "푸른 파수꾼",
        "unique": true
      },
      {
        "apiName": "TFT_Item_Redemption",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_TearOfTheGoddess",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "@HealTickRate@초마다 1칸 내에 있는 아군의 체력을 대상이 잃은 체력의 @MissingHealthHeal@%만큼 회복. 또한 효과를 받은 아군은 @HealTickRate@초 동안 공격으로 입는 피해량이 @AoEDamageReduction@% 감소 (피해량 감소는 중첩되지 않음)<br><br><TFTTrackerLabel>체력 회복:</TFTTrackerLabel> <TFTHighlight>@TFTUnitProperty.item:TFT_Tracker_Value1@</TFTHighlight>",
        "effects": {
          "AoEDamageReduction": 10,
          "HealTickRate": 5,
          "Health": 150,
          "HexRadius": 1,
          "Mana": 15,
          "MaxHeal": 1000,
          "MissingHealthHeal": 15
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Redemption.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "구원",
        "unique": false
      },
      {
        "apiName": "TFT_Item_UnstableConcoction",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_TearOfTheGoddess",
          "TFT_Item_SparringGloves"
        ],
        "desc": "2가지 효과 획득:<li>공격력 @BaseAD*100@%, 주문력 @BaseSP@<li><TFTKeyword>모든 피해 흡혈</TFTKeyword> @BaseHeal@%<br><br>라운드마다 위 효과 중 1개 무작위로 두 배 증가<br><br><tftitemrules><tftbold>모든 피해 흡혈</tftbold>: 입힌 피해의 일부만큼 체력 회복</tftitemrules>",
        "effects": {
          "BaseAD": 0.15000000596046448,
          "BaseHeal": 15,
          "BaseSP": 15,
          "BonusSP": 15,
          "CritChance": 20,
          "Mana": 15,
          "{693a77ae}": 0.15000000596046448,
          "{a60806db}": 66.66699981689453
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Hand_of_Justice.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "정의의 손길",
        "unique": false
      },
      {
        "apiName": "TFT_Item_WarmogsArmor",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_GiantsBelt",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "@BonusPercentHP*100@%의 최대 체력 획득",
        "effects": {
          "Health": 600,
          "{dd270afd}": 0.07999999821186066
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Warmogs_Armor.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "워모그의 갑옷",
        "unique": false
      },
      {
        "apiName": "TFT_Item_PowerGauntlet",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_GiantsBelt",
          "TFT_Item_SparringGloves"
        ],
        "desc": "보호막 공격 후 @Duration@초 동안 피해량 @DamageAmpPct@% 증가",
        "effects": {
          "AP": 10,
          "AS": 20,
          "CritChance": 20,
          "DamageAmpPct": 25,
          "Duration": 3,
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Stridebreaker.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "방패파괴자",
        "unique": false
      },
      {
        "apiName": "TFT_Item_Quicksilver",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_SparringGloves",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "전투 시작: @SpellShieldDuration@초 동안 군중 제어 효과에 면역. 이 동안 @ProcInterval@초마다 @ProcAttackSpeed*100@%의 공격 속도 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AS": 30,
          "CritChance": 20,
          "MagicResist": 20,
          "SpellShieldDuration": 14,
          "{530a7d84}": 0.03999999910593033,
          "{d1b54a6c}": 2
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Quicksilver.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "수은",
        "unique": true
      },
      {
        "apiName": "TFT_Item_ThiefsGloves",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_SparringGloves",
          "TFT_Item_SparringGloves"
        ],
        "desc": "매 라운드: 무작위 아이템 2개 장착<br><br><tftitemrules>[아이템 슬롯 3개 소모.]</tftitemrules>",
        "effects": {
          "CritChance": 20,
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Thieves_Gloves.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "도적의 장갑",
        "unique": false
      },
      {
        "apiName": "TFT_Item_ForceOfNature",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_Spatula"
        ],
        "desc": "아군의 최대 팀 규모 +@MaxArmySizeIncrease@ 증가",
        "effects": {
          "MaxArmySizeIncrease": 1
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Standard/Tacticians_Crown.tex",
        "id": null,
        "incompatibleTraits": [],
        "name": "전략가의 왕관",
        "unique": false
      }
    ],
  };

  static Map<String , dynamic> emblem = {
    "data": [
      {
        "apiName": "TFT11_Item_StoryweaverEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_ChainVest"
        ],
        "desc": "장착 시 이야기꾼 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Armor": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Skyweaver.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Storyweaver"
        ],
        "name": "이야기꾼 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_DryadEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_GiantsBelt"
        ],
        "desc": "장착 시 숲지기 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Dryad.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Dryad"
        ],
        "name": "숲지기 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_UmbralEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_SparringGloves"
        ],
        "desc": "장착 시 암영 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "CritChance": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Umbral.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Umbral"
        ],
        "name": "암영 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_FatedEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_NeedlesslyLargeRod"
        ],
        "desc": "장착 시 필연 특성 획득<br><br>필연 추가 효과: @ProcRate@초마다 <keyword>@HPRegen*100@%</keyword>의 체력을 회복합니다.<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AP": 10,
          "HPRegen": 0.029999999329447746,
          "ProcRate": 3
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Fated.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Fated"
        ],
        "name": "필연 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_HeavenlyEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_NegatronCloak"
        ],
        "desc": "장착 시 천계 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "MagicResist": 20
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Heavenly.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Heavenly"
        ],
        "name": "천계 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_MythicEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_TearOfTheGoddess"
        ],
        "desc": "장착 시 신화 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Mana": 15
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Mythic.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Mythic"
        ],
        "name": "신화 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_GhostlyEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_BFSword",
          "TFT_Item_Spatula"
        ],
        "desc": "장착 시 혼령 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AD": 0.10000000149011612
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Ghostly.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Ghostly"
        ],
        "name": "혼령 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_PorcelainEmblemItem",
        "associatedTraits": [],
        "composition": [
          "TFT_Item_Spatula",
          "TFT_Item_RecurveBow"
        ],
        "desc": "장착 시 도자기 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "AS": 10
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Porcelain.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Porcelain"
        ],
        "name": "도자기 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_ReaperEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 사신 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Reaper.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Reaper"
        ],
        "name": "사신 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_SageEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 현자 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Sage.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Sage"
        ],
        "name": "현자 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_DragonlordEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 용군주 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Dragonlord.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Dragonlord"
        ],
        "name": "용군주 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_SniperEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 저격수 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Sniper.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Sniper"
        ],
        "name": "저격수 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_ChallengerEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 결투가 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Duelist.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Duelist"
        ],
        "name": "결투가 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_BehemothEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 거대 괴수 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Behemoth.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Behemoth"
        ],
        "name": "거대 괴수 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_InvokerEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 기원자 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Invoker.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Invoker"
        ],
        "name": "기원자 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_BruiserEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 난동꾼 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Bruiser.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Bruiser"
        ],
        "name": "난동꾼 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_FortuneEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 행운 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Fortune.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Fortune"
        ],
        "name": "행운 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_InkShadowEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 먹그림자 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_InkShadow.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_InkShadow"
        ],
        "name": "먹그림자 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_WardenEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 파수꾼 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Warden.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Warden"
        ],
        "name": "파수꾼 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_SpellslingerEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 비전 마법사 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Arcanist.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Arcanist"
        ],
        "name": "비전 마법사 상징",
        "unique": true
      },
      {
        "apiName": "TFT11_Item_AltruistEmblemItem",
        "associatedTraits": [],
        "composition": [],
        "desc": "장착 시 이타심 특성 획득<br><br><tftitemrules>[고유 - 중복 적용 불가]</tftitemrules>",
        "effects": {
          "Health": 150
        },
        "from": null,
        "icon": "ASSETS/Maps/Particles/TFT/Item_Icons/Traits/Spatula/Set11/TFT_Set11_Emblem_Altruist.tex",
        "id": null,
        "incompatibleTraits": [
          "TFT11_Altruist"
        ],
        "name": "이타심 상징",
        "unique": true
      }
    ]
  };
}