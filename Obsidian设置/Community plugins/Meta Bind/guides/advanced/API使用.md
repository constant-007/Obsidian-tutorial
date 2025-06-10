---
title: Meta Bind API
description: 如何使用 Meta Bind JavaScript API 的指南。
---

Meta Bind 提供了一个 JavaScript API，允许您通过 JavaScript 与 Meta Bind 内部机制进行交互。

API 的文档可以在[这里](/obsidian-meta-bind-plugin-docs/api/classes/obsapi/)找到。

## 用法

要使用 API，您需要某种方式来执行 JavaScript。这可以通过另一个插件来完成，如 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin) 或 [Dataview](https://blacksmithgu.github.io/obsidian-dataview/api/intro/)。

在您可以使用 API 之前，您需要获得对它的引用。这可以通过首先获得已加载的 Meta Bind 插件的实例，然后从中获取 API 来完成。

  <TabItem label="使用 JS Engine">
```js
// 首先我们获得 Meta Bind 插件的实例，然后访问 API。
// 如果插件未加载，这将返回 `undefined`。
const mb = engine.getPlugin('obsidian-meta-bind-plugin')?.api;

// 可选：处理插件未加载的情况。
if (!mb) {
// ...
}

// 现在我们可以使用 API 了！

````
  </TabItem>
  <TabItem label="纯 JavaScript">
```js
// `app` 指的是 Obsidian App 对象，根据您执行 JavaScript 的方式，您可能需要从某个地方获取它。
// 首先我们获得 Meta Bind 插件的实例，然后访问 API。
// 如果插件未加载，这将返回 `null`。
const mb = app.plugins.getPlugin('obsidian-meta-bind-plugin')?.api;

// 可选：处理插件未加载的情况。
if (!mb) {
    // ...
}

// 现在我们可以使用 API 了！
````

  </TabItem>

:::caution
不要尝试将 API 方法用作独立函数。这会导致错误，因为类方法会失去通过 `this` 对自身的引用。

```js
// 不要这样做
const { someAPIMethod } = app.plugins.getPlugin('obsidian-meta-bind-plugin')?.api;
someAPIMethod(); // 很可能会出错
// 或者
const someAPIMethod = app.plugins.getPlugin('obsidian-meta-bind-plugin')?.api.someAPIMethod;
someAPIMethod(); // 很可能会出错

// 这样做
const mb = app.plugins.getPlugin('obsidian-meta-bind-plugin')?.api;
mb.someAPIMethod(); // 正常工作
```

这是 JavaScript 类的一般问题。

```js
class Foo {
	constructor() {
		this.bar = 5;
	}

	baz() {
		console.log(this.bar);
	}
}

const foo = new Foo();
foo.baz(); // 将记录 5

const { baz } = foo;
// `baz` 变成了独立函数，因此 `this` 现在是 `undefined`。
baz(); // 错误：无法访问属性 `bar`，`this` 是 `undefined`

const baz2 = foo.baz;
// `baz2` 变成了独立函数，因此 `this` 现在是 `undefined`。
baz2(); // 错误：无法访问属性 `bar`，`this` 是 `undefined`
```

:::

## 生命周期管理

:::danger

不处理可挂载对象的生命周期可能导致内存泄漏和其他错误。确保仔细阅读本节，并记住始终清理自己。

:::

在使用 Meta Bind API 时，生命周期管理非常重要。您需要确保清理自己以防止内存泄漏和其他错误。

大多数需要生命周期管理的东西都继承自 [`Mountable`](/obsidian-meta-bind-plugin-docs/api/classes/mountable)，它有一个 `mount` 和 `unmount` 方法。
如果您调用 `mount`，您需要在某个时候调用 `unmount`。

API 提供了一个名为 `wrapInMDRC` 的帮助函数，可用于为您处理可挂载对象的生命周期。

```js
// 创建一个可挂载对象。
const mountable = ...;

// 通过帮助函数挂载可挂载对象。
// `container` 是可挂载对象应该挂载到的父 HTMLElement。
// `component` 是一个 Obsidian `Component` 对象。
mb.wrapInMDRC(mountable, container, component);
```

在后台，这将创建一个 [`MarkdownRenderChild`](https://docs.obsidian.md/Reference/TypeScript+API/MarkdownRenderChild)，
它分别在加载和卸载时挂载和卸载可挂载对象，然后将该 [`MarkdownRenderChild`](https://docs.obsidian.md/Reference/TypeScript+API/MarkdownRenderChild) 注册为组件的子组件。

您也可以通过将可挂载对象挂载到 DOM 然后注册回调来在组件销毁时卸载它来自己处理生命周期。

```js
// 创建一个可挂载对象。
const mountable = ...;

// 将可挂载对象挂载到 DOM。
mountable.mount(container);
// 注册回调以在组件销毁时卸载可挂载对象。
component.register(() => mountable.unmount());
```

## 示例

:::note
以下示例使用来自 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin) 插件的 `js-engine` 代码块。
要按原样使用示例，确保您已安装并启用 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin) 插件。
虽然 API 在没有它的情况下也可以使用，但示例在没有 [JS Engine](https://github.com/mProjectsCode/obsidian-js-engine-plugin) 的情况下可能无法工作。

JS Engine 独有的使用全局变量如下。
有关它们的更多信息，请参阅 [JS Engine 文档](https://www.moritzjung.dev/obsidian-js-engine-plugin-docs/api/interfaces/jsexecutionglobals/)。

- `engine` - 指的是 JS Engine API。
- `context.file` - 包含 `js-engine` 代码块的文件的 `TFile` 对象。这仅在笔记的上下文中可用。
- `container` - 渲染内容的容器。这是 `HTMLElement` 类型。
- `component` - 用于生命周期管理的 Obsidian `Component`。
:::

### 按钮

通过 API 创建按钮。

```js
// 首先我们获得 Meta Bind 插件的实例，然后访问 API。
const mb = app.plugins.getPlugin('obsidian-meta-bind-plugin')?.api;

// 我们创建一个按钮配置对象。
const buttonConfig = {
	label: 'Greet the World',
	style: 'primary',
	action: {
		type: 'inlineJS',
		code: "console.log('Hello World!');",
	},
};

// 我们指定按钮选项。
const buttonOptions = {
	declaration: buttonConfig,
	isPreview: false,
};

// 我们创建按钮。这将返回继承自 `Mountable` 并可以挂载到 DOM 的东西。
const button = mb.createButtonMountable(context.file.path, buttonOptions);

// 将按钮挂载到 DOM 并确保在组件销毁时卸载它。
mb.wrapInMDRC(button, container, component);
```

如果您足够大胆，可以跳过中间对象。

```js
// 首先我们获得 Meta Bind 插件的实例，然后访问 API。
const mb = app.plugins.getPlugin('obsidian-meta-bind-plugin')?.api;

// 我们创建按钮。这将返回继承自 `Mountable` 并可以挂载到 DOM 的东西。
const button = mb.createButtonMountable(context.file.path, {
	// 按钮选项
	declaration: {
		// 按钮配置
		label: 'Greet the World',
		style: 'primary',
		action: {
			type: 'inlineJS',
			code: "console.log('Hello World!');",
		},
	},
	isPreview: false,
});

// 将按钮挂载到 DOM 并确保在组件销毁时卸载它。
mb.wrapInMDRC(button, container, component);
```

### Input Fields

通过 API 创建输入字段。

```js
const mb = engine.getPlugin('obsidian-meta-bind-plugin').api;
const primeNumberBound = 200;

/*
 * 一个函数来计算给定边界内的素数。
 */
function calculatePrimeNumbers(bound) {
	const primeNumbers = [2];

	for (let i = 3; i <= bound; i++) {
		let halfI = i / 2;
		for (const p of primeNumbers) {
			if (p > halfI) {
				primeNumbers.push(i);
				break;
			}
			if (i % p === 0) {
				break;
			}
		}
	}

	return primeNumbers;
}

// 创建输入字段声明和绑定目标及参数。
const declaration = {
	inputFieldType: 'suggester',
	bindTarget: mb.createBindTarget('frontmatter', context.file.path, ['favoritePrime']),
	arguments: calculatePrimeNumbers(primeNumberBound).map(x => {
		return {
			name: 'option',
			value: [x.toString()],
		};
	}),
};

// 创建输入字段选项。
const options = {
	declaration: declaration,
	renderChildType: 'block',
};

// 创建输入字段。
const inputField = mb.createInputFieldMountable(context.file.path, options);

// 将输入字段挂载到 DOM 并确保在组件销毁时卸载它。
mb.wrapInMDRC(inputField, container, component);
```