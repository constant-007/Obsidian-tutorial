---
BaseSpeed: 80
SpeedMultiplier: 0.5
HoursPerDay: 8
TravelDistance: 65
MilesPerHour: 3
TemperatureMaxTravelHours: 2
---

### PF2e 旅行计算器

# 旅行速度
更新下面的计算器会将更改传播到任何自动计算旅行距离的笔记。你需要刷新此笔记才能看到计算更改。

| PF2e Travel Calculator                                                                                                                                                                                                                                                                                                                          |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **队伍速度 (最慢的):** `INPUT[inlineSelect(option(1, 10 Feet), option(1.5, 15 Feet), option(2, 20 Feet), option(2.5, 25 Feet),  option(3, 30 Feet),  option(3.5, 35 Feet),  option(4, 40 Feet),  option(5, 50 Feet),  option(6, 60 Feet)):MilesPerHour]`                                                                                    |
| **地形类型:** `INPUT[inlineSelect(option(1, Normal Terrain), option(0.5, Difficult Terrain), option(0.333333, Greater Difficult Terrain)):SpeedMultiplier]`                                                                                                                                                                                 |
| **温度:** `INPUT[inlineSelect(option(2, Incredible Cold - Moderate dmg every minute), option(4, Extreme Cold - Minor cold dmg every 10 minutes), option(4, Severe Cold - Minor cold dmg every hour), option(4, Mild Cold - None), option(8, Normal - None), option(4, Mild Heat - None), option(4, Severe Heat - Minor fire dmg every hour), option(4, Extreme Heat - Minor fire dmg every 10 minutes), option(2, Incredible Heat - Moderate fire dmg every minute)):TemperatureMaxTravelHours]` |
| **每日最大旅行小时数:** `VIEW[round({TemperatureMaxTravelHours},1)]`                                                                                                                                                                                                                                                                      |
| **每日旅行小时数:** `INPUT[number:HoursPerDay]` `VIEW[{HoursPerDay}>{TemperatureMaxTravelHours} ? "Suffer Fatigue" : "No Fatigue"]`                                                                                                                                                                                                                                                                          |
| **旅行距离 (英里):**  `INPUT[number:TravelDistance]`                                                                                                                                                                                                                                                                                            |
| **每日旅行距离:** `VIEW[round({MilesPerHour}*{HoursPerDay},1)]`  miles                                                                                                                                                                                                                                                            |
| **旅行天数 🕓:** `VIEW[round({TravelDistance} / (({MilesPerHour}*{HoursPerDay})*{SpeedMultiplier}),1)]`                                                                                                                                                                                                                                                                                                                                                |

## 表格 10-11: 环境伤害

| **类别** | **伤害** |
| ------------ | ---------- |
| Minor        | 1d6-2d6    |
| Moderate     | 4d6-6d6    |
| Major        | 8d6-12d6   |
| Massive      | 16d6-24d6  |
