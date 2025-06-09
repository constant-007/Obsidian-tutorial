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
| Incredibly Easy | -10        |
| Very Easy       | -5         |
| Easy            | -2         |
| Normal          | 0          |
| Hard            | +2         |
| Very Hard       | +5         |
| Incredibly Hard | +10        |

### DC 计算器

DC 等级: `INPUT[number:playerLevel]`

| 难度               | DC                                                                                                                   |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------- |
| Incredibly Easy          | `VIEW[{memory^baseDC} - 10]`                                                                                         |
| Very Easy                | `VIEW[{memory^baseDC} - 5]`                                                                                          |
| Easy                     | `VIEW[{memory^baseDC} - 2]`                                                                                          |
| Normal                   | `VIEW[{playerLevel} < 20 ? {playerLevel} + 14 + floor({playerLevel} / 3) : {playerLevel} * 2][math():memory^baseDC]` |
| Hard (Uncommon)          | `VIEW[{memory^baseDC} + 2]`                                                                                          |
| Very Hard (Rare)         | `VIEW[{memory^baseDC} + 5]`                                                                                          |
| Incredibly Hard (Unique) | `VIEW[{memory^baseDC} + 10]`                                                                                         |

法术等级: `INPUT[number:spellLevel]`

| 法术稀有度 | DC                                                                                             |
| ------------ | ---------------------------------------------------------------------------------------------- |
| Normal       | `VIEW[(({spellLevel} * 2 - 1) + 14 + floor(({spellLevel} * 2 - 1) / 3))][:memory^baseSpellDC]` |
| Uncommon     | `VIEW[{memory^baseSpellDC} + 2]`                                                               |
| Rare         | `VIEW[{memory^baseSpellDC} + 5]`                                                               |
| Unique       | `VIEW[{memory^baseSpellDC} + 10]`                                                              |

