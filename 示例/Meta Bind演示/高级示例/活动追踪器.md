---
activities:
  - from: 03:00
    to: 04:17
    activity: sudying
    status: 0
  - from: 00:03
    activity: youtube
    to: 03:00
    status: +
---

### 活动追踪器

```js-engine
const mb = engine.getPlugin('obsidian-meta-bind-plugin').api;

const tableOptions = {
	bindTarget: mb.createBindTarget('frontmatter', context.file.path, ['activities']),
	tableHead: ['开始时间', '结束时间', '活动', '状态'],
	columns: [
		'INPUT[time:scope^from]',
		'INPUT[time:scope^to]',
		'INPUT[inlineSelect(option(youtube), option(sudying), option(linch)):scope^activity]',
		'INPUT[inlineSelect(option(-, 无意义), option(0, 正常), option(+, 有意义)):scope^status]',
	],
};

const mountable = mb.createTableMountable(context.file.path, tableOptions);

mb.wrapInMDRC(mountable, container, component);
```