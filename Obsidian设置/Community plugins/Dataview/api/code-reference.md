# 代码块参考

Dataview JavaScript代码块使用`dataviewjs`语言规范创建：

~~~
```dataviewjs
dv.table([], ...)
```
~~~

API通过隐式提供的`dv`（或`dataview`）变量可用，通过该变量您可以查询信息、渲染HTML并配置视图。

异步API调用用`⌛`标记。

## 查询
查询方法允许您查询Dataview索引以获取页面元数据；要渲染此数据，请使用[渲染部分](#render)中的方法。

### `dv.current()`

获取脚本当前执行页面的页面信息（通过`dv.page()`）。

### `dv.pages(source)`

接受单个字符串参数`source`，其形式与[查询语言源](../reference/sources.md)相同。
返回页面对象的[数据数组](data-array.md)，这些是包含所有页面字段作为值的普通对象。

```js
dv.pages() => 库中的所有页面
dv.pages("#books") => 所有带有'books'标签的页面
dv.pages('"folder"') => 来自文件夹"folder"的所有页面
dv.pages("#yes or -#no") => 所有带有#yes标签或没有#no标签的页面
dv.pages('"folder" or #tag') => 所有带有#tag标签或来自文件夹"folder"的页面
```

请注意，文件夹需要在字符串内用双引号引起来（即，`dv.pages("folder")`不起作用，但`dv.pages('"folder"')`起作用）——这是为了完全匹配源在查询语言中的写法。

### `dv.pagePaths(source)`

与`dv.pages`相同，但只返回匹配给定源的页面路径的[数据数组](data-array.md)。

```js
dv.pagePaths("#books") => 带有'books'标签的页面路径
```

### `dv.page(path)`

将简单路径或链接映射到完整的页面对象，其中包括所有页面字段。自动进行链接解析，如果未提供扩展名，将自动确定扩展名。

```js
dv.page("Index") => /Index的页面对象
dv.page("books/The Raisin.md") => /books/The Raisin.md的页面对象
```

## 渲染

### `dv.el(element, text)`

在给定的html元素中渲染任意文本。
```js
dv.el("b", "这是一些粗体文本");
```

您可以通过`cls`指定要添加到元素的自定义类，通过`attr`指定附加属性：

```js
dv.el("b", "这是一些文本", { cls: "dataview dataview-class", attr: { alt: "很好！" } });
```

### `dv.header(level, text)`

渲染给定文本的1-6级标题。

```js
dv.header(1, "大！");
dv.header(6, "小");
```

### `dv.paragraph(text)`

在段落中渲染任意文本。

```js
dv.paragraph("这是一些文本");
```

### `dv.span(text)`

在span中渲染任意文本（上方/下方无填充，与段落不同）。

```js
dv.span("这是一些文本");
```

### `dv.execute(source)`

执行任意dataview查询并将视图嵌入到当前页面中。

```js
dv.execute("LIST FROM #tag");
dv.execute("TABLE field1, field2 FROM #thing");
```

### `dv.executeJs(source)`

执行任意DataviewJS查询并将视图嵌入到当前页面中。

```js
dv.executeJs("dv.list([1, 2, 3])");
```

### `dv.view(path, input)`

复杂函数，允许自定义视图。将尝试在给定路径加载JavaScript文件，传递`dv`和`input`并允许其执行。这允许您在多个页面中重用自定义视图代码。请注意，这是一个异步函数，因为它涉及文件I/O——确保`await`结果！

```js
await dv.view("views/custom", { arg1: ..., arg2: ... });
```

如果您还想在视图中包含自定义CSS，可以传递包含`view.js`和`view.css`的文件夹路径；CSS将自动添加到视图中：

```
views/custom
 -> view.js
 -> view.css
```

视图脚本可以访问`dv`对象（API对象）和`input`对象，`input`对象正是`dv.view()`第二个参数的内容。

请记住，`dv.view()`无法从以点开头的目录（如`.views`）读取。错误用法示例：

```js
await dv.view(".views/view1", { arg1: 'a', arg2: 'b' });
```
尝试这样做将产生以下异常：

```
Dataview: custom view not found for '.views/view1/view.js' or '.views/view1.js'.
```

另外请注意，目录路径始终从库根目录开始。

#### 示例
在此示例中，我们在`scripts`目录中有一个名为`view1.js`的自定义脚本文件。

**文件：** `scripts/view1.js`
```js
console.log(`Loading view1`);

function foo(...args) {
  console.log('foo is called with args', ...args);
}
foo(input)
```

我们在`projects`下有一个Obsidian文档。我们将使用`scripts/view1.js`路径从该文档调用`dv.view()`。

**文档：** `projects/customViews.md`
```js
await dv.view("scripts/view1", { arg1: 'a', arg2: 'b' }) 
```

执行上述脚本时，它将打印以下内容：

```
Loading view1
foo is called with args {arg1: 'a', arg2: 'b'}
```

## 数据视图

### `dv.list(elements)`

渲染元素的dataview列表；接受普通数组和数据数组。

```js
dv.list([1, 2, 3]) => 1, 2, 3的列表
dv.list(dv.pages().file.name) => 所有文件名的列表
dv.list(dv.pages().file.link) => 所有文件链接的列表
dv.list(dv.pages("#book").where(p => p.rating > 7)) => 评分大于7的所有书籍的列表
```

### `dv.taskList(tasks, groupByFile)`

渲染`Task`对象的dataview列表，如通过`page.file.tasks`获得的。默认情况下，此视图将自动按任务的原始文件分组。如果您明确提供`false`作为第二个参数，它将以单个统一列表的形式渲染它们。

```js
// 列出标记为'#project'的页面中的所有任务
dv.taskList(dv.pages("#project").file.tasks)

// 列出标记为#project的页面中所有*未完成*的任务
dv.taskList(dv.pages("#project").file.tasks
    .where(t => !t.completed))

// 列出标记为#project的页面中所有带有'#tag'标签的任务
dv.taskList(dv.pages("#project").file.tasks
    .where(t => t.text.includes("#tag")))

// 列出标记为'#project'的页面中的所有任务，不进行分组。
dv.taskList(dv.pages("#project").file.tasks, false)
```

### `dv.table(headers, elements)`

使用给定的标题列表和元素的2D数组渲染表格。标题应该是字符串列表，元素应该是任意dataview值（可能是链接、字符串、数字等）的2D数组。

```js
dv.table(["Name", "Value"], [["A", 1], ["B", 2]])
```

您还可以使用表格来渲染嵌套列表，而无需显式创建列表字符串：

```js
dv.table(["文件", "任务"],
	dv.pages("#project").map(p => [
		p.file.link,
		p.file.tasks.map(t => t.text)
	])
);
```

如果您要渲染包含数组的任何表格行，渲染器将呈现这些数组中的项目列表：

```js
	dv.table(["Name", "Phone Numbers", "Age"],
		[["Pete", 
			["555-123-4567", 
			 "555-123-4568", 
			 "555-123-4569"], 
		  20],
		 ["Joan", 
			["555-193-3419"],
		  25],
		 ["Maverick", 
			["555-1923-3487"], 
		  35]
		]
	);
```

这将渲染为：

```js
	dv.table(["Name", "Lists", "Dummy"],
		[["Pete", 
				["项目符号1",
				 "项目符号2",
				 "项目符号3"],
			 "虚拟"],
			["行3", "虚拟", "虚拟"]
		]
	);
```

一个如何渲染按评分排序的简单书籍信息表格的示例。

```js
dv.table(["文件", "流派", "阅读时间", "评分"], dv.pages("#book")
    .sort(b => b.rating)
    .map(b => [b.file.link, b.genre, b["time-read"], b.rating]))
```

## Markdown数据视图

渲染为您可以按需渲染或操作的纯Markdown字符串的函数。

### `dv.markdownTable(headers, values)`

等效于`dv.table()`，使用给定的标题列表和元素的2D数组渲染表格，但返回纯Markdown。

```js
// 渲染按评分排序的简单书籍信息表格。
const table = dv.markdownTable(["文件", "流派", "阅读时间", "评分"], dv.pages("#book")
    .sort(b => b.rating)
    .map(b => [b.file.link, b.genre, b["time-read"], b.rating]))

dv.paragraph(table);
```

### `dv.markdownList(values)`

等效于`dv.list()`，渲染给定元素的列表，但返回纯Markdown。

```js
const markdown = dv.markdownList([1, 2, 3]);
dv.paragraph(markdown);
```

### `dv.markdownTaskList(tasks)`

等效于`dv.taskList()`，渲染任务列表，但返回纯Markdown。

```js
const markdown = dv.markdownTaskList(dv.pages("#project").file.tasks);
dv.paragraph(markdown);
```
 
## 实用工具

### `dv.array(value)`

将给定值或数组转换为Dataview[数据数组](data-array.md)。如果值已经是数据数组，则返回不变。

```js
dv.array([1, 2, 3]) => dataview数据数组[1, 2, 3]
```

### `dv.isArray(value)`

如果给定值是数组或dataview数组，则返回true。

```js
dv.isArray(dv.array([1, 2, 3])) => true
dv.isArray([1, 2, 3]) => true
dv.isArray({ x: 1 }) => false
```

### `dv.fileLink(path, [embed?], [display-name])`

将文本路径转换为Dataview`Link`对象；您还可以可选地指定链接是否嵌入以及它的显示名称。

```js
dv.fileLink("2021-08-08") => 指向名为"2021-08-08"的文件的链接
dv.fileLink("book/The Raisin", true) => 指向"The Raisin"的嵌入链接
dv.fileLink("Test", false, "Test File") => 指向文件"Test"的链接，显示名称为"Test File"
```

### `dv.sectionLink(path, section, [embed?], [display?])`

将文本路径+节名称转换为Dataview`Link`对象；您还可以可选地指定链接是否嵌入以及它的显示名称。

```js
dv.sectionLink("Index", "Books") => [[Index#Books]]
dv.sectionLink("Index", "Books", false, "My Books") => [[Index#Books|My Books]]
```

### `dv.blockLink(path, blockId, [embed?], [display?])`

将文本路径+块ID转换为Dataview`Link`对象；您还可以可选地指定链接是否嵌入以及它的显示名称。

```js
dv.blockLink("Notes", "12gdhjg3") => [[Index#^12gdhjg3]]
```

### `dv.date(text)`

将文本和链接强制转换为luxon`DateTime`；如果提供`DateTime`，则返回不变。

```js
dv.date("2021-08-08") => 2021年8月8日的DateTime
dv.date(dv.fileLink("2021-08-07")) => 2021年8月8日的dateTime
```

### `dv.duration(text)`

将文本强制转换为luxon`Duration`；使用与Dataview持续时间类型相同的解析规则。

```js
dv.duration("8 minutes") => Duration { 8 minutes }
dv.duration("9 hours, 2 minutes, 3 seconds") => Duration { 9 hours, 2 minutes, 3 seconds }
```

### `dv.compare(a, b)`

根据dataview的默认比较规则比较两个任意JavaScript值；如果您正在编写自定义比较器并希望回退到默认行为，这很有用。如果`a < b`返回负值，如果`a = b`返回0，如果`a > b`返回正值。

```js
dv.compare(1, 2) = -1
dv.compare("yes", "no") = 1
dv.compare({ what: 0 }, { what: 0 }) = 0
```

### `dv.equal(a, b)`

比较两个任意JavaScript值，如果根据Dataview的默认比较规则它们相等，则返回true。

```js
dv.equal(1, 2) = false
dv.equal(1, 1) = true
```

### `dv.clone(value)`

深度克隆任何Dataview值，包括日期、数组和链接。

```js
dv.clone(1) = 1
dv.clone({ a: 1 }) = { a: 1 }
```

### `dv.parse(value)`

将任意字符串对象解析为复杂的Dataview类型（主要支持链接、日期和持续时间）。

```js
dv.parse("[[A]]") = Link { path: A }
dv.parse("2020-08-14") = DateTime { 2020-08-14 }
dv.parse("9 seconds") = Duration { 9 seconds }
```

## 文件I/O

这些实用方法都包含在`dv.io`子API中，并且都是*异步的*（用⌛标记）。

### ⌛ `dv.io.csv(path, [origin-file])`

从给定路径（链接或字符串）加载CSV。相对路径将相对于可选的原始文件解析（如果未提供，则默认为当前文件）。返回dataview数组，每个元素包含CSV值的对象；如果文件不存在，返回`undefined`。

```js
await dv.io.csv("hello.csv") => [{ column1: ..., column2: ...}, ...]
```

### ⌛ `dv.io.load(path, [origin-file])`

异步加载给定路径（链接或字符串）的内容。相对路径将相对于可选的原始文件解析（如果未提供，则默认为当前文件）。返回文件的字符串内容，如果文件不存在则返回`undefined`。

```js
await dv.io.load("File") => "# File\nThis is an example file..."
```

### `dv.io.normalize(path, [origin-file])`

将相对链接或路径转换为绝对路径。如果提供了`origin-file`，则解析就像您从该文件解析链接一样进行；如果没有，路径相对于当前文件解析。

```js
dv.io.normalize("Test") => "dataview/test/Test.md"，如果在"dataview/test"内
dv.io.normalize("Test", "dataview/test2/Index.md") => "dataview/test2/Test.md"，不管当前文件
```

## 查询求值

### ⌛ `dv.query(source, [file, settings])`

执行Dataview查询并以结构化返回的形式返回结果。此函数的返回类型根据执行的查询类型而变化，但总是一个带有表示返回类型的`type`的对象。此版本的`query`返回结果类型——您可能需要`tryQuery`，它在查询执行失败时抛出错误。

```javascript
await dv.query("LIST FROM #tag") =>
    { successful: true, value: { type: "list", values: [value1, value2, ...] } }

await dv.query(`TABLE WITHOUT ID file.name, value FROM "path"`) =>
    { successful: true, value: { type: "table", headers: ["file.name", "value"], values: [["A", 1], ["B", 2]] } }

await dv.query("TASK WHERE due") =>
    { successful: true, value: { type: "task", values: [task1, task2, ...] } }
```

`dv.query`接受两个额外的可选参数：
1. `file`：解析查询的文件路径（在引用`this`的情况下）。默认为当前文件。
2. `settings`：运行查询的执行设置。这主要是高级用例（我建议您直接检查API实现以查看所有可用选项）。

### ⌛ `dv.tryQuery(source, [file, settings])`

与`dv.query`完全相同，但在短脚本中更方便，因为执行失败将作为JavaScript异常抛出，而不是结果类型。

### ⌛ `dv.queryMarkdown(source, [file], [settings])`

等效于`dv.query()`，但返回渲染的Markdown。

```js
await dv.queryMarkdown("LIST FROM #tag") =>
    { successful: true, value: { "- [[Page 1]]\n- [[Page 2]]" } }
```

### ⌛ `dv.tryQueryMarkdown(source, [file], [settings])`

与`dv.queryMarkdown()`完全相同，但在解析失败时抛出错误。

### `dv.tryEvaluate(expression, [context])`

求值任意dataview表达式（如`2 + 2`或`link("text")`或`x * 9`）；在解析或求值失败时抛出`Error`。`this`是一个总是可用的隐式变量，引用当前文件。

```js
dv.tryEvaluate("2 + 2") => 4
dv.tryEvaluate("x + 2", {x: 3}) => 5
dv.tryEvaluate("length(this.file.tasks)") => 当前文件中的任务数量
```

### `dv.evaluate(expression, [context])`

求值任意dataview表达式（如`2 + 2`或`link("text")`或`x * 9`），返回结果的`Result`对象。您可以通过检查`result.successful`（然后获取`result.value`或`result.error`）来解包结果类型。如果您想要一个在求值失败时抛出错误的更简单API，请使用`dv.tryEvaluate`。

```js
dv.evaluate("2 + 2") => Successful { value: 4 }
dv.evaluate("2 +") => Failure { error: "Failed to parse ... " }
```
