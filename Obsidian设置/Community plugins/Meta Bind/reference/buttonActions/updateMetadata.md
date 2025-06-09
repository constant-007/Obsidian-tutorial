---
title: Update Metadata
description: Update Metadata button action reference.
---

**更新元数据** 动作允许您通过 [绑定目标](/obsidian-meta-bind-plugin-docs/guides/bindtargets) 更新指定的属性。
此属性可以是任何有效的 [绑定目标](/obsidian-meta-bind-plugin-docs/guides/bindtargets)，例如文件的前言元数据。

```ts
interface UpdateMetadataButtonAction {
	type: 'updateMetadata';
	bindTarget: string; // 要更新的属性的绑定目标
	evaluate: boolean; // 是否将值作为JavaScript表达式处理
	value: string; // 要设置的属性值或要计算的JavaScript表达式
}
```

如果 `evaluate` 设置为 `true`，值将被视为JavaScript表达式并进行计算。
属性的当前值在表达式中可作为 `x` 使用。

可以使用 `getMetadata(bindTarget)` 引用其他属性，其中 `bindTarget` 是 [绑定目标](/obsidian-meta-bind-plugin-docs/guides/bindtargets) 字符串。

:::tip[防止YAML和验证错误]

确保在JavaScript表达式周围使用引号，以避免意外创建无效的YAML。

:::

:::note[需要启用JavaScript]

当尝试使用 `evaluate` 选项运行JavaScript表达式时，请确保您：

1. 在Meta Bind设置中启用了 **JavaScript**。

:::

#### 示例

此按钮组允许您增加、减少和重置存储在当前文件前言中的计数器。

````custom_markdown {7-10,19-22,31-34} "BUTTON[count-decrement, count-reset, count-increment]"
```meta-bind-button
label: "+1"
hidden: true
id: "count-increment"
style: default
actions:
  - type: updateMetadata
    bindTarget: count
    evaluate: true
    value: "x + 1"
```

```meta-bind-button
label: "-1"
hidden: true
id: "count-decrement"
style: default
actions:
  - type: updateMetadata
    bindTarget: count
    evaluate: true
    value: "x - 1"
```

```meta-bind-button
label: "Reset"
hidden: true
id: "count-reset"
style: default
actions:
  - type: updateMetadata
    bindTarget: count
    evaluate: false
    value: 0
```

`BUTTON[count-decrement, count-reset, count-increment]` `VIEW[{count}]`
````

这是一个简单的生命值追踪器，例如用于桌面角色扮演游戏(TTRPG)。

````custom_markdown
---
health: 35
max_health: 50
damage: 5
---

```meta-bind-button
label: "Deal"
style: destructive
hidden: true
id: "deal-damage"
actions:
  - type: updateMetadata
    bindTarget: health
    evaluate: true
    value: "x - getMetadata('damage')"
```

```meta-bind-button
label: "Reset"
style: primary
hidden: true
id: "reset-health"
actions:
  - type: updateMetadata
    bindTarget: health
    evaluate: true
    value: "getMetadata('max_health')"
```

Health: `VIEW[{health}][text]` `BUTTON[reset-health]`

Damage: `INPUT[number:damage]` `BUTTON[deal-damage]`
````