---
playerLevel: 10
spellLevel: 5
---

### PF2e DC 计算器

### 按熟练度的 DC

| 熟练度 | DC  |
| ----------- | --- |
| Untrained   | 10  |
| Trained     | 15  |
| Expert      | 20  |
| Master      | 30  |
| Legendary   | 40  |

### DC 调整

| 难度      | 调整 |
| --------------- | ---------- |
| 极其简单 | -10        |
| 非常简单       | -5         |
| 简单            | -2         |
| 普通          | 0          |
| 困难            | +2         |
| 非常困难       | +5         |
| 极其困难 | +10        |

### DC 计算器

DC 等级: `INPUT[number:playerLevel]`

| 难度               | DC                                                                                                                   |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------- |
| 极其简单          | `VIEW[{memory^baseDC} - 10]`                                                                                         |
| 非常简单                | `VIEW[{memory^baseDC} - 5]`                                                                                          |
| 简单                     | `VIEW[{memory^baseDC} - 2]`                                                                                          |
| 普通                   | `VIEW[{playerLevel} < 20 ? {playerLevel} + 14 + floor({playerLevel} / 3) : {playerLevel} * 2][math():memory^baseDC]` |
| 困难 (罕见)          | `VIEW[{memory^baseDC} + 2]`                                                                                          |
| 非常困难 (稀有)         | `VIEW[{memory^baseDC} + 5]`                                                                                          |
| 极其困难 (独特) | `VIEW[{memory^baseDC} + 10]`                                                                                         |

法术等级: `INPUT[number:spellLevel]`

| 法术稀有度    | DC                                                                                             |
| -------- | ---------------------------------------------------------------------------------------------- |
| 普通   | `VIEW[(({spellLevel} * 2 - 1) + 14 + floor(({spellLevel} * 2 - 1) / 3))][:memory^baseSpellDC]` |
| 罕见 | `VIEW[{memory^baseSpellDC} + 2]`                                                               |
| 稀有     | `VIEW[{memory^baseSpellDC} + 5]`                                                               |
| 独特   | `VIEW[{memory^baseSpellDC} + 10]`                                                              |

