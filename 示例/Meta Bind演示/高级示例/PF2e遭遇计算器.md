---
playerCount: 6
playerLevel: 4
enemy:
  - name: Somthing
    level: 2
    count: 2
    variant: 0
  - name: Some other thing
    level: 2
    count: 1
    variant: 0
  - name: dragon
    level: 3
    count: 2
    variant: -1
  - name: 测试
    level: 5
    count: 1
    variant: 0
测试:
  - a
  - b
  - c
---

### PF2e 遭遇计算器

### 队伍信息

玩家数量: `INPUT[number:playerCount]`
玩家等级: `INPUT[number:playerLevel]`

### 敌人

```js-engine
const mb = engine.getPlugin('obsidian-meta-bind-plugin').api;

const tableOptions = {
	bindTarget: mb.createBindTarget('frontmatter', context.file.path, ['enemy']),
	tableHead: ['名称', '等级', '变体', '数量'],
	columns: [
		'INPUT[text:scope^name]',
		'INPUT[number(class(meta-bind-small-width)):scope^level]',
		'INPUT[inlineSelect(option(-1, 弱小), option(0, 普通), option(1, 精英)):scope^variant]',
		'INPUT[number(class(meta-bind-small-width)):scope^count]',
	],
};

const mountable = mb.createTableMountable(context.file.path, tableOptions);

mb.wrapInMDRC(mountable, container, component);
```

### 遭遇统计

```meta-bind-js-view
{enemy} and children as enemies
{playerLevel} as playerLevel
---

function getXP(enemyLevel) {
	const diff = enemyLevel - context.bound.playerLevel;
	if (diff === -4) {
		return 10;
	}
	if (diff === -3) {
		return 15;
	}
	if (diff === -2) {
		return 20;
	}
	if (diff === -1) {
		return 30;
	}
	if (diff === 0) {
		return 40;
	}
	if (diff === 1) {
		return 60;
	}
	if (diff === 2) {
		return 80;
	}
	if (diff === 3) {
		return 120;
	}
	if (diff === 4) {
		return 160;
	}
	return -1;
}

function calculateTotalXP() {
	let acc = 0;
	for (const enemy of context.bound.enemies) {
		const xp = getXP((enemy.level ?? 0) + (enemy.variant ?? 0));
		if (xp === -1) {
			return -1;
		}
		acc += xp * (enemy.count ?? 0);
	}
	return acc;
}

return engine.markdown.create(`遭遇 XP: **${calculateTotalXP()}**`);
```

> [!info] XP 参考表
> 
> | Trivial                    | Low                        | Moderate                   | Severe                     | Extreme                    |
> | -------------------------- | -------------------------- | -------------------------- | -------------------------- | -------------------------- |
> | `VIEW[{playerCount} * 10]`    | `VIEW[{playerCount} * 15]`     | `VIEW[{playerCount} * 20]`    | `VIEW[{playerCount} * 30]`    | `VIEW[{playerCount} * 40]`    |