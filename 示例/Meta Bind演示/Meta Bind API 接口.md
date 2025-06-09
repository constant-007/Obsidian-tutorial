---
select: b
---

## 使用 JS Engine 创建输入字段

JS Engine 可以在[这里](https://github.com/mProjectsCode/obsidian-js-engine-plugin)找到。

**代码**
```js
const mb = engine.getPlugin('obsidian-meta-bind-plugin').api;

const options = ['a', 'b', 'c'];

const arguments = options.map(x => ({
	name: 'option',
	value: [x],
}));

arguments.push({
	name: 'title',
	value: ['我是使用 JS Engine 和 Meta Bind API 创建的'],
});

const bindTarget = mb.parseBindTarget('select', context.file.path);

const mountable = mb.createInputFieldMountable(context.file.path, {
	renderChildType: 'block',
	declaration: {
		inputFieldType: 'select',
		bindTarget: bindTarget,
		arguments: arguments,
	},
});

mb.wrapInMDRC(mountable, container, component);
```

**生成的输入字段**
```js-engine
const mb = engine.getPlugin('obsidian-meta-bind-plugin').api;

const options = ['a', 'b', 'c'];

const arguments = options.map(x => ({
	name: 'option',
	value: [x],
}));

arguments.push({
	name: 'title',
	value: ['我是使用 JS Engine 和 Meta Bind API 创建的'],
});

const bindTarget = mb.parseBindTarget('select', context.file.path);

const mountable = mb.createInputFieldMountable(context.file.path, {
	renderChildType: 'block',
	declaration: {
		inputFieldType: 'select',
		bindTarget: bindTarget,
		arguments: arguments,
	},
});

mb.wrapInMDRC(mountable, container, component);
```
