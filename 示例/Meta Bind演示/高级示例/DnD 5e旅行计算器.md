---
BaseSpeed: 40
SpeedMultiplier: 0.666667
AdditionalBonus: 0
Encumbered: false
HorseshoesofSpeed: false
HoursPerDay: 8
MinutesPerMile: 20
ExhaustionLevel: 0
TravelDistance: 1000
varMins: 60
---

### D&D 5e 旅行计算器

| DnD5e Travel Calculator |
| ---- |
| **选择基础速度:** `INPUT[inlineSelect(option(30, Walking), option(50, Camel), option(40, Donkey), option(40, Mule), option(40, Draft Horse), option(40, Elephant), option(40, Mastiff), option(40, Moorbounder), option(40, Pony), option(40, Rhinoceros), option(60, Riding Horse), option(40, Saber-Toothed Tiger), option(60, Warhorse), option(20, Griffon [walking]), option(80, Griffon [flying]), option(40, Hippogriff [walking]), option(60, Hippogriff [flying]), option(60, Pegasus [walking]), option(90, Pegasus [flying]), option(20, Peryton [walking]), option(60, Peryton [flyingg]), option(50, Unicorn), option(60, Peryton [flying]), option(50, Unicorn), option(50, Broom of Flying), option(30, Broom of Flying [over  200 lbs]), option(80, Carpet of Flying [3ft x 5ft]), option(60, Carpet of Flying [4ft x 6ft]), option(40, Carpet of Flying [5ft x 7ft]), option(30, Carpet of Flying [6ft x 9ft]), option(300, Wind Walk), option(50, Cauldron of Flying), option(30, Cart pulled by Horses), option(30, Cart pulled by PCs), option(20, PHB Galley), option(5, PHB Keelboat), option(15, PHB Longship), option(10, PHB Rowboat), option(10, PHB Sailing Ship), option(15, PHB Warship), option(45, Aquisions Inc Battle Balloon), option(15, Aquisions Inc Mechanical Beholder), option(200, Ebberon Lyrandar Airship), option(100, Ebberon Lyrandar Galleon), option(300, Ebberon Orien Lightning Rail), showcase):BaseSpeed]` |
| **选择旅行速度:** `INPUT[inlineSelect(option(1, 正常速度), option(1.333333, 缓慢速度), option(0.666667, 快速), showcase):SpeedMultiplier]` |
| 额外速度加成: `INPUT[number:AdditionalBonus]` |
| 负重状态: `INPUT[toggle:Encumbered]` (`VIEW[{Encumbered} ? -10 : 0]`) 疾行马蹄铁: `INPUT[toggle:HorseshoesofSpeed]` (`VIEW[{HorseshoesofSpeed} ? 30 : 0]`) |
| **每日旅行小时数:** `INPUT[number:HoursPerDay]` |
| 疲劳等级: `INPUT[inlineSelect(option(0, 0 无疲劳), option(1, 1 能力检定劣势), option(2, 2 速度减半), option(3, 3 攻击掷骰和豁免投掷劣势), option(4, 4 生命值上限减半), option(5, 5 速度降为0), option(6, 6 死亡)):ExhaustionLevel]` |
| 新基础速度: `VIEW[{BaseSpeed} / ({ExhaustionLevel} > 1 ? 2 : 1) + ({Encumbered} ? -10 : 0) + ({HorseshoesofSpeed} ? 30 : 0) + {AdditionalBonus}]` |
| 旅行距离 (英里):  `INPUT[number:TravelDistance]` |
| **旅行天数 🕓:** `VIEW[round(({TravelDistance} * ({varMins}/(({BaseSpeed} / ({ExhaustionLevel} > 1 ? 2 : 1) + ({Encumbered} ? -10 : 0) + ({HorseshoesofSpeed} ? 30 : 0) + {AdditionalBonus}) / 10) * {SpeedMultiplier})) / 60 / {HoursPerDay}, 1)]` |

在 [Josh's Publish](https://obsidianttrpgtutorials.com/Obsidian+TTRPG+Tutorials/Plugin+Tutorials/Travel+Calculators/DnD+5e+Travel+Calc/DnD+5e+Travel+Calc) 查看这个计算器。