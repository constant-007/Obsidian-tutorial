# 代码块示例

## 分组书籍

通过流派对书籍进行分组，然后为每个分组创建一个按评分排序的表格，这是dataview渲染API的直接用法：

```js
for (let group of dv.pages("#book").groupBy(p => p.genre)) {
	dv.header(3, group.key);
	dv.table(["名称", "阅读时间", "评分"],
		group.rows
			.sort(k => k.rating, 'desc')
			.map(k => [k.file.link, k["time-read"], k.rating]))
}
```

![分组书籍示例](../assets/grouped-book-example.png)

## 查找所有直接和间接链接的页面

使用简单的集合+栈深度优先搜索来查找链接到当前笔记或您选择的笔记的所有笔记：

```js
let page = dv.current().file.path;
let pages = new Set();

let stack = [page];
while (stack.length > 0) {
	let elem = stack.pop();
	let meta = dv.page(elem);
	if (!meta) continue;

	for (let inlink of meta.file.inlinks.concat(meta.file.outlinks).array()) {
		console.log(inlink);
		if (pages.has(inlink.path)) continue;
		pages.add(inlink.path);
		stack.push(inlink.path);
	}
}

// 数据现在是直接或间接链接到当前页面的每个页面的文件元数据。
let data = dv.array(Array.from(pages)).map(p => dv.page(p));
```
