了解完通过[[Git：同步|Git插件]]在不同设备间同步Obsidian笔记，解决使用方面最基本的问题，下一个我想介绍的插件是Dataview。因为它是我个人觉得最有用的Obsidian插件。这个插件可以为工作进度、会议、读书笔记等信息创建数据库视图，增强Obsidian的信息管理和知识连接能力

对我来说，笔记软件的数据库功能在工作上发挥的作用最直接、有效。它允许用户系统地组织任务信息，跟踪任务进度。转到Obsidian之前，我通过Notion的数据库功能帮我管理每月工作任务

![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/notion-databse-view.jpg)

使用Obsidian后，我发现Dataview插件可以对标Notion数据库功能。它能实现Notion数据库的大部分核心功能。下面是我仿照Notion的数据库功能，用Dataview生成的数据库视图，包含前者的筛选、排序、实时更新信息等核心功能：

![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/dataview-database-view.jpg)

我还在这里做了一个[[项目管理总视图|示例]]，感兴趣的小伙伴可以去玩一下，在Obsidian笔记中实操，这样能更深刻地体会到Dataview插件的能力

![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/dataview-database-template.jpg)

## Dataview基本介绍

下面我们看下Dataview插件的具体介绍

Dataview插件允许你将你的笔记库（Vault）视为一个数据库，并从中提取、筛选、排序和展示数据。通过使用类似 SQL 的查询语言 (Dataview Query Language - DQL) 或者 JavaScript，你可以动态地生成笔记列表、表格、任务列表等，极大地增强了 Obsidian 的组织和知识管理能力

核心功能：

- **动态数据提取与展示：** Dataview 最核心的功能就是能够根据你设定的条件，从你的笔记中动态地提取信息并以多种格式展示
- **灵活的查询语言 (DQL)：** Dataview 提供了自己的一套查询语言，它借鉴了 SQL 的一些概念，但更为简洁易懂。你可以通过 DQL 来指定数据来源 (FROM)、筛选条件 (WHERE)、排序方式 (SORT) 等
- **多种视图格式：**
    - **LIST (列表):** 将符合条件的笔记以简单的列表形式展示
    - **TABLE (表格):** 可以选择笔记的特定元数据 (YAML frontmatter 或行内字段) 作为列来生成表格
    - **TASK (任务列表):** 专门用于收集和展示笔记中的待办事项
    - **CALENDAR (日历):** 可以将带有日期的笔记在日历视图中展示
- **支持多种数据来源：**
    - **标签 (Tags):** 例如，`FROM #project` 会选择所有包含 `#project` 标签的笔记
    - **文件夹 (Folders):** 例如，`FROM "日记"` 会选择 "日记" 文件夹下的所有笔记
    - **链接 (Links):** 例如，`FROM outgoing("笔记A")` 会选择 "笔记A" 中链接出去的笔记。
    - **特定文件：** 可以直接指定文件名
- **元数据驱动：** Dataview 主要依赖于笔记的元数据。这些元数据可以来自：
    - **YAML Frontmatter:** 笔记顶部的 YAML 数据块，用于定义结构化数据，如 `creation_date: 2025-05-24`
    - **行内字段 (Inline Fields):** 在笔记正文中，使用 `Key:: Value` 格式定义的字段，例如 `完成状态:: 进行中`
- **JavaScript 查询 (DataviewJS):** 对于更复杂的需求，DQL 可能不够用。DataviewJS 允许你使用 JavaScript 来编写查询逻辑，提供了几乎无限的灵活性和控制力。你可以访问 Obsidian 的 API 和 Dataview 提供的函数

然而，普通Dataview生成的查询是一个**只读性视图**，不具备Notion数据库那样在视图层面直接进行数据条目创建、属性编辑等复杂交互能力。好消息是我发现通过Dataviewjs + Meta Edit插件，实际上可以“曲线救国”，实现和Notion数据库一样的交互能力。所以下面我们单独把Dataviewjs拎出来说一下

## DataviewJS：Dataview 插件的“超级马力模式”

简单来说，DataviewJS 是 Dataview 插件提供的一种高级查询和渲染方式。它允许你使用 JavaScript 语言来代替或扩展标准的 Dataview 查询语言 (DQL)，从而实现远超 DQL 能力的复杂数据处理和高度自定义的视图展示

许多Notion数据库的复杂功能都可以通过Dataviewjs自行实现。如果你觉得 Dataview 的标准查询 (DQL) 在某些场景下功能不够强大，或者想要输出非常个性化的视图效果，那么 DataviewJS 就是为你准备的

**为什么以及何时使用 DataviewJS？**

标准的 DQL 简洁易学，能满足大部分常见的笔记查询和聚合需求。但以下场景中，DataviewJS 会显示出其强大的优势：

1. **极端复杂的查询逻辑：** 当你需要多重嵌套的筛选、复杂的条件判断、自定义的排序算法，或者需要结合多个数据源进行复杂计算时，DQL 可能会显得力不从心，而 JavaScript 的编程能力则能轻松应对
2. **高度自定义的输出格式：** DQL 提供的 `LIST`, `TABLE`, `TASK`, `CALENDAR` 视图虽然实用，但样式和结构相对固定。如果你想生成独特的HTML结构、自定义CSS样式、甚至是嵌入图表（借助其他JS库或技巧）或交互元素，DataviewJS 允许你直接操作DOM (文档对象模型) 和渲染HTML
3. **数据转换与处理：** 在展示数据之前，你可能需要对数据进行复杂的转换、计算、聚合或格式化，JavaScript 强大的数据处理能力可以完美胜任
4. **与 Obsidian API 或其他插件的潜在交互：** 作为 JavaScript，理论上它有更大的潜力去调用 Obsidian 自身的 API (尽管Dataview本身封装了主要交互) 或与其他插件进行更深度的集成 (比如Meta Edit插件API)
5. **访问更底层的元数据：** 有时某些文件的特定属性或计算值可能不直接暴露给DQL，但可以通过DataviewJS的API获取

Notion数据库那样直接编辑视图数据的能力能够通过Dataview与其他插件结合实现，但我也是最近才发现这个玩法，还没有系统研究过，等我成功实现后再更新一下吧 #有待更新 

总而言之，DataviewJS 是 Dataview 插件的进阶功能，它通过 JavaScript 的强大编程能力，将你的笔记查询和知识组织提升到了一个全新的高度，让你几乎可以实现任何你能想到的数据聚合与展示需求

## Dataview插件后台设置

![](https://img.aiexplorernote.com/%E4%BD%BF%E7%94%A8Git%E6%8F%92%E4%BB%B6%E8%AE%A9Obsidian%E5%AE%9E%E7%8E%B0%E5%90%8C%E6%AD%A5/dataview-settings-1.jpg)


### Enable inline queries

启用或禁用常规的行内 Dataview 查询。如果开启，你就可以在笔记的普通文本行中使用特定的前缀（默认为 =``）来直接执行 Dataview 查询，而无需创建完整的代码块。例如，``= [[任务]].due`` 会显示链接到“任务”笔记的`due`字段。如果关闭，以``=`` 开头的行内查询将不会被解析或执行

### Enable JavaScript queries

启用或禁用执行 DataviewJS 查询。如果开启，你可以使用 `dataviewjs` 语言代码块来运行基于 JavaScript 的更复杂、更灵活的查询。如果关闭，所有 `dataviewjs` 代码块都将失效

### Enable inline JavaScript queries

启用或禁用行内 DataviewJS 查询。如果开启（开关为绿色），你可以在笔记的普通文本行中使用特定的前缀（默认为 =``）来直接执行简短的 JavaScript Dataview 查询。注意： 此选项的生效依赖于上面的 “Enable JavaScript queries” 选项也必须处于开启状态

### Enable inline field highlighting in reading view

在阅读视图中启用或禁用行内字段的视觉高亮/美化渲染。如果开启，当你在 Obsidian 的阅读视图（Reading view）查看笔记时，符合 Dataview 行内字段格式的文本（例如 `优先级:: 高` 或 `创建日期:: 2025-05-25`）会以更醒目或格式化的方式显示。关闭则使其显示为普通文本

### Enable inline field highlighting in Live Preview

在实时预览模式下启用或禁用行内字段的视觉高亮/美化渲染。如果开启，当你在 Obsidian 的实时预览模式（Live Preview）下编辑或查看笔记时，行内字段会得到特殊的高亮或美化处理。这与阅读视图中的高亮是分别控制的

### DataviewJS keyword

DataviewJS 代码块的关键字。默认值为 `dataviewjs`。这个设置决定了当你想要创建一个 Dataview JavaScript 查询代码块时，需要在代码块声明语言时使用的标识符。例如，` dataviewjs `。如果修改了这个关键字，需要重载 Obsidian才能使更改生效

### Inline query prefix

行内查询的前缀。默认值为 =``。这个字符（或字符串）标志着一个普通 Dataview 行内查询的开始。例如，如果你想直接在文本中查询某个文件的创建日期，可以写 `= [[文件名]].file.cday`

### JavaScript inline query prefix

JavaScript 行内查询的前缀。默认值为 \$=``。这个字符（或字符串）标志着一个 DataviewJS 行内查询的开始。例如，你可以使用 `$= dv.current().file.mtime` 来获取当前文件的修改时间

### Code block inline queries

代码块内的行内查询。如果开启（开关为绿色），那么即使是写在**完整代码块内部**的行内查询（即以 =``或``$=`` 开头的行），也会被 Dataview 解析和执行。在大多数标准用例中，这个选项可能不太常用，主要用于一些高级或特定的代码块编写技巧

### Display result count 

显示结果计数。如果关闭此选项，则在 `TASK`（任务）和 `TABLE`（表格）类型查询的结果头部将隐藏显示结果数量的小数字。默认开启时，你会看到类似“3个结果”或“10个任务”这样的提示

### Warn on empty result 

空结果时发出警告。如果开启此选项，当一个 Dataview 查询返回0个结果时，插件会在页面上渲染一条警告消息

### Render null as

Null值渲染为。此设置定义了在 Dataview 表格中，当某个字段的值为 `null`（空）或不存在时，默认显示什么内容。默认值是 `\`-`` (一个反斜杠加一个连字符)，这在 Markdown 中通常会渲染成一个短横线。你可以修改这个值，它支持 Markdown 标记。例如，你可以将其设置为空白，或者其他你认为合适的占位符

### Automatic view refreshing

自动视图刷新。如果启用此选项，当你的 Obsidian 知识库中的文件发生更改时，Dataview 视图（如图表、列表等）将会自动刷新以显示最新的数据。**注意：** 这可能会对某些功能产生负面影响，比如在 Dataview 视图中嵌入其他内容。如果遇到这类功能不正常工作的情况，可以尝试关闭此选项

### Refresh interval

刷新间隔。此设置定义了在文件停止更改后，Dataview 需要等待多长时间（以毫秒为单位）才更新视图。默认值是 `2500` 毫秒（即2.5秒）。这意味着在你停止编辑文件2.5秒后，相关的 Dataview 视图才会开始刷新。增加这个值可以减少频繁编辑时的刷新次数，降低性能开销；减少这个值可以更快地看到更新，但可能会更频繁地触发刷新

### Date format

日期格式。设置默认的日期显示格式。这里使用的是 Luxon 库的日期格式化选项。当前格式示例是 `MMMM dd, yyyy` (例如，渲染为 "May 27, 2025")。你可以在此修改为你偏好的日期显示方式，例如 `yyyy-MM-dd` 会显示为 "2025-05-27"

### Date + time format

日期 + 时间格式。设置默认的日期和时间显示格式，同样基于 Luxon 库。图片中显示的当前格式示例是 `h:mm a - MMMM dd, yyyy` (例如，渲染为 "7:34 AM - May 27, 2025")。你可以根据自己的需要调整这个格式字符串

### Primary column name

主列名称。在通过 Dataview 生成的表格中，这个设置定义了默认的“ID 列”的名称。这个 ID 列是自动生成的第一列，它包含了指向源文件（即数据来源的那个笔记）的链接。默认值为 `File`

### Grouped column name

分组列名称。当 Dataview 表格是基于分组数据生成时（使用 `GROUP BY` 子句），这个设置定义了默认的“ID 列”的名称。这个 ID 列同样是自动生成的第一列，它链接到源文件或代表该分组的键。默认值为 `Group`

### Automatic task completion tracking

自动任务完成跟踪。如果启用此选项，当你在 Dataview 生成的视图中勾选完成一个任务时，Dataview 会自动在该任务的文本末尾附加一个包含完成日期的字段。该字段的默认名称和日期格式如示例所示：`- [x] my task \`[completion:: 2022-01-01]``。这个功能可以帮助你记录任务的实际完成时间。如果关闭，勾选任务仅改变其完成状态，不会自动添加完成日期

### Use emoji shorthand for completion

使用表情符号作为完成简写。此选项仅在上面的 “Automatic task completion tracking” 启用时才可用。如果开启，Dataview 可能会使用特定的表情符号（例如 ✅）配合简化的日期格式来标记任务的完成，而不是完整的 `[completion:: yyyy-MM-dd]` 字段

### Completion field name

完成字段名称。此选项仅在 “Automatic task completion tracking” 启用 **且** “Use emoji shorthand for completion” (使用表情符号作为完成简写) **禁用** 时才可用。它允许你自定义在任务完成时自动添加的那个元数据字段的名称。默认情况下，这个字段名是 `completion` (如示例中的 `[completion:: ...]`)。你可以在这里修改为你偏好的字段名，例如 `完成于`

### Completion date format

完成日期格式。此选项仅在 “Automatic task completion tracking” 启用 **且** “Use emoji shorthand for completion” (使用表情符号作为完成简写) **禁用** 时才可用。它允许你自定义在任务完成时自动记录的日期的格式，这里同样遵循 Luxon 库的日期格式化规则。例如，你可以设置为 `yyyy-MM-dd HH:mm` 来同时记录时间和日期

### Recursive sub-task completion

递归子任务完成。如果启用此选项（开关为绿色），当你在 Dataview 视图中完成一个父任务时，其下所有的子任务（sub-tasks）也会被自动标记为完成

## 氛围编程轻松解决Dataview查询编写

尽管Dataview与Dataviewjs功能强大，但使用它们都需要有一定的编程基础。好在现在有AI，即使不懂代码的编程小白也可以通过[氛围编程](https://www.aiexplorernote.com/article/cursor-basics)轻松编写Dataview查询，创建数据库视图

## 小结

对于想更进一步了解Dataview插件的小伙伴，可以去阅读[官方文档](https://blacksmithgu.github.io/obsidian-dataview/)。同时，我在“Obsidian设置/Community plugins/Dataview/Dataview项目文档翻译”目录下做了对官方文档的翻译，与官方的markdown文档一模一样，想看中文的小伙伴可以直接在那里查看