---
STR: 8
DEX: 16
CON: 11
INT: 12
WIS: 14
CHR: 11
PROF_mod: 5
proficiency:
  acrobatics: 2
  arcana: 1
  deception: 0.5
---

### D&D 5e 属性分数和调整值计算器

这个示例从属性分数计算 D&D 角色的属性调整值，并在列表中显示所有内容。

调整值存储在 `memory` 中而不是前置元数据中。这减少了混乱，但需要一些隐藏字段来计算值，而列表中的字段只是格式化值以始终包含 `+/-` 符号。

## 角色属性分数

```meta-bind
VIEW[ floor(({STR} - 10) / 2) ][math(hidden):memory^STR_mod]
```
```meta-bind
VIEW[ floor(({DEX} - 10) / 2) ][math(hidden):memory^DEX_mod]
```
```meta-bind
VIEW[ floor(({CON} - 10) / 2) ][math(hidden):memory^CON_mod]
```
```meta-bind
VIEW[ floor(({INT} - 10) / 2) ][math(hidden):memory^INT_mod]
```
```meta-bind
VIEW[ floor(({WIS} - 10) / 2) ][math(hidden):memory^WIS_mod]
```
```meta-bind
VIEW[ floor(({CHR} - 10) / 2) ][math(hidden):memory^CHR_mod]
```

- 力量: `VIEW[**{STR}**][text(renderMarkdown)]` (`VIEW[ concat(isPositive({memory^STR_mod}) ? '+' : '', string({memory^STR_mod})) ][math]`)
- 敏捷: `VIEW[**{DEX}**][text(renderMarkdown)]` (`VIEW[ concat(isPositive({memory^DEX_mod}) ? '+' : '', string({memory^DEX_mod})) ][math]`)
- 体质: `VIEW[**{CON}**][text(renderMarkdown)]` (`VIEW[ concat(isPositive({memory^CON_mod}) ? '+' : '', string({memory^CON_mod})) ][math]`)
- 智力: `VIEW[**{INT}**][text(renderMarkdown)]` (`VIEW[ concat(isPositive({memory^INT_mod}) ? '+' : '', string({memory^INT_mod})) ][math]`)
- 感知: `VIEW[**{WIS}**][text(renderMarkdown)]` (`VIEW[ concat(isPositive({memory^WIS_mod}) ? '+' : '', string({memory^WIS_mod})) ][math]`)
- 魅力: `VIEW[**{CHR}**][text(renderMarkdown)]` (`VIEW[ concat(isPositive({memory^CHR_mod}) ? '+' : '', string({memory^CHR_mod})) ][math]`)

## 技能调整值

如果我们想要计算角色的技能调整值，同时考虑到它的 proficiency，我们可以利用 `inlineSelect` 输入将 proficiency 类型映射到数值，同时仍然拥有一个良好的、可编辑的界面。
我们还可以根据当前选择的值为输入设置样式，以获得有用的视觉指示器。

#### 这里你可以看到它如何工作的示例

首先我们需要设置 proficiency modifier: `INPUT[number:PROF_mod]`

`INPUT[inlineSelect(option(0,不熟练), option(0.5,半熟练), option(1,熟练), option(2,专精), defaultValue(0), class(dnd5e-skill-prof)):proficiency.acrobatics]` 特技 (敏捷) `VIEW[floor({proficiency.acrobatics}*{PROF_mod})+{memory^DEX_mod}]`
`INPUT[inlineSelect(option(0,不熟练), option(0.5,半熟练), option(1,熟练), option(2,专精), defaultValue(0), class(dnd5e-skill-prof)):proficiency.arcana]` 奥秘 (智力) `VIEW[floor({proficiency.arcana}*{PROF_mod})+{memory^INT_mod}]`
`INPUT[inlineSelect(option(0,不熟练), option(0.5,半熟练), option(1,熟练), option(2,专精), defaultValue(0), class(dnd5e-skill-prof)):proficiency.deception]` 欺骗 (魅力) `VIEW[floor({proficiency.deception}*{PROF_mod})+{memory^CHR_mod}]`
`INPUT[inlineSelect(option(0,不熟练), option(0.5,半熟练), option(1,熟练), option(2,专精), defaultValue(0), class(dnd5e-skill-prof)):proficiency.perception]` 察觉 (感知) `VIEW[floor({proficiency.perception}*{PROF_mod})+{memory^WIS_mod}]`
