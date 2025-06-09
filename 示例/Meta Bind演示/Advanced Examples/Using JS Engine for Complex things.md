---
text: abcasdas
locked: true
from_year: a22
to_year: "23"
---

### 使用 JS Engine 实现复杂功能

锁定状态: `INPUT[toggle:locked]`

```js-engine
const mb = engine.getPlugin('obsidian-meta-bind-plugin').api;
// 用于管理在渲染函数中创建的字段生命周期的组件
const comp = new obsidian.Component(component);

// 创建一个绑定目标到我们关心的属性
const bindTarget = mb.parseBindTarget('locked', context.file.path);

// 渲染函数，它以锁定值作为参数
function render(value) {
	// 首先我们卸载组件以从之前的重新渲染中卸载内容
	comp.unload();
	// 然后我们再次加载组件进行这次重新渲染
	comp.load();
	// 然后我们清空要渲染的元素以删除之前重新渲染中创建的内容
	container.empty();

	// 接下来我们基于锁定值创建字段
	let field;
	if (value) {
		field = mb.createInlineFieldFromString("VIEW[{text}][text]", context.file.path, undefined);
	} else {
		field = mb.createInlineFieldFromString("INPUT[text:text]", context.file.path, undefined);
	}

	// 最后我们渲染该字段
	mb.wrapInMDRC(field, container, comp);
}

// 我们从渲染函数创建一个响应式组件，初始值将是绑定目标的值
const reactive = engine.reactive(render, mb.getMetadata(bindTarget));

// 然后我们订阅绑定目标指向的元数据，每当绑定目标值改变时重新渲染响应式组件
const subscription = mb.subscribeToMetadata(
	bindTarget,
	component,
	(value) => reactive.refresh(value)
);

return reactive;
```

```js-engine
const mb = engine.getPlugin('obsidian-meta-bind-plugin').api;

const bindTarget = mb.parseBindTarget('text', context.file.path);

function onUpdate(value) {
	return value.toString();
}

const reactive = engine.reactive(onUpdate, mb.getMetadata(bindTarget));

const subscription = mb.subscribeToMetadata(
	bindTarget,
	component,
	(value) => reactive.refresh(value)
);

return reactive;
```

`INPUT[text:from_year]`
`INPUT[text:to_year]`

```js-engine
// 获取 metabind API 并提取元数据字段
const mb     = engine.getPlugin('obsidian-meta-bind-plugin').api;
const mbFrom = mb.parseBindTarget('from_year', context.file.path);
const mbTo   = mb.parseBindTarget('to_year', context.file.path);

return mb.reactiveMetadata([mbFrom, mbTo], component, (from, to) => {
	return [from, to]
})
```