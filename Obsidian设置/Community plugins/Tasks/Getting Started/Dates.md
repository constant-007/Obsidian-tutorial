---
publish: true
---

# 日期

<span class="related-pages">#feature/dates</span>

## 何时处理任务

本节解释您可以添加到任务行的不同类型的日期，以便告诉Tasks您希望/需要何时完成工作。

您不必使用所有可用的日期。
也许截止日期对您来说就足够了。
不要过度设计您的任务管理。

> [!info]
> 您可以在创建或编辑任务时使用`Tasks: Create or edit`命令，而不是手动添加表情符号和日期。
当您使用该命令时，您还可以设置诸如"星期一"、"明天"或"下周"之类的日期，Tasks将自动以正确的格式保存日期。
您可以在[[Create or edit Task|'Create or edit Task' Modal]]中了解更多信息。

> [!info]
> 如果您更喜欢打字，现在使用[[Auto-Suggest|智能自动建议]]为您的任务添加表情符号和其他信息非常容易。

<!-- NEW_TASK_FIELD_EDIT_REQUIRED -->

---

### 截止日期

任务可以有必须完成的日期：截止日期。

为了指定任务的截止日期，您必须在任务末尾附加"截止日期标识符📅"，后跟截止日期。
日期必须采用`YYYY-MM-DD`格式，即带前导零的`年-月-日`。

例如：`📅 2021-04-09`表示任务在2021年4月9日到期。

```markdown
- [ ] 倒垃圾 📅 2021-04-09
```

在Tasks查询块中使用的相关指令：

- [[Filters#Due Date|截止日期过滤器]]
- [[Sorting#Due Date|截止日期排序]]
- [[Grouping#Due Date|截止日期分组]]
- 可作为[[Task Properties#Values for Dates in Tasks|任务属性]]`task.due`访问

---

### 计划日期

任务可以有您计划处理它们的日期：计划日期。
计划日期与截止日期不同，因为您可以安排在截止日期之前完成任务。

计划日期使用沙漏表情符号：⏳。

```markdown
- [ ] 倒垃圾 ⏳ 2021-04-09
```

另请参阅：

- [[Use Filename as Default Date|使用文件名作为默认日期]]了解如何可选地让Tasks使用文件名中的任何日期作为该文件中所有未标注日期任务的计划日期。
- [[Recurring Tasks#Remove scheduled date on recurrence|重复时删除计划日期]]用于控制新的重复任务是否自动安排。

在Tasks查询块中使用的相关指令：

- [[Filters#Scheduled Date|计划日期过滤器]]
- [[Sorting#Scheduled Date|计划日期排序]]
- [[Grouping#Scheduled Date|计划日期分组]]
- 可作为[[Task Properties#Values for Dates in Tasks|任务属性]]`task.scheduled`访问

---

### 开始日期

可能会发生您在某个日期之前无法处理任务的情况。
或者您想隐藏任务直到某个日期。
在这种情况下，您可以使用开始日期。

开始日期使用起飞飞机表情符号：🛫

```markdown
- [ ] 倒垃圾 🛫 2021-04-09
```

当按开始日期[[Filters#Start Date|过滤]]查询时，
结果将包括没有开始日期的任务。
这样，您可以使用开始日期作为过滤器来过滤掉您尚无法处理的任何任务。

这样的过滤器可能是：

````markdown
```tasks
starts before tomorrow
```
````

在Tasks查询块中使用的相关指令：

- [[Filters#Start Date|开始日期过滤器]]
- [[Sorting#Start Date|开始日期排序]]
- [[Grouping#Start Date|开始日期分组]]
- 可作为[[Task Properties#Values for Dates in Tasks|任务属性]]`task.start`访问

## 跟踪任务历史

本节解释Tasks可以为您自动添加的日期类型。

### 日期跟踪设置

本节中的日期类型是可选的。

![Settings for tracking task histories](../../images/settings-optional-date-fields.png)

跟踪任务历史的默认设置图像。

### 创建日期

> [!released]
创建日期在Tasks 2.0.0中引入。

如果您在设置中启用"为每个添加的任务设置创建日期"（并重启Obsidian），Tasks插件将帮助您跟踪任务的创建时间。

请参阅上面的[[#Date-tracking settings|截图]]。

创建日期使用粗加号表情符号：➕。

```markdown
- [ ] 倒垃圾 ➕ 2021-04-09
```

在Tasks查询块中使用的相关指令：

- [[Filters#Created Date|创建日期过滤器]]
- [[Sorting#Created Date|创建日期排序]]
- [[Grouping#Created Date|创建日期分组]]
- 可作为[[Task Properties#Values for Dates in Tasks|任务属性]]`task.created`访问

#### 为任务添加创建日期

以下Tasks功能为任务添加创建日期...

...如果启用了创建日期，则自动添加：

- [[Create or edit Task|'Create or edit Task' Modal]]，当它创建全新任务时
- 当您完成[[Recurring Tasks|重复任务]]时，新任务的创建日期将显示添加日期。

...根据请求，并且始终启用：

- 通过[[Auto-Suggest|自动建议]]中的`➕ created today`选项。
  - 请注意，这在建议列表中位置较低，因此您可能需要开始输入`created`或`today`的几个字符才能看到它。

### 完成日期

除非您在设置中禁用"为每个完成的任务设置完成日期"（并重启Obsidian），否则Tasks插件将帮助您跟踪任务的完成时间。

请参阅上面的[[#Date-tracking settings|截图]]。

完成日期使用白色对勾表情符号：✅。

```markdown
- [x] 倒垃圾 ✅ 2021-04-09
```

在Tasks查询块中使用的相关指令：

- [[Filters#Done Date|完成日期过滤器]]
- [[Sorting#Done Date|完成日期排序]]
- [[Grouping#Done Date|完成日期分组]]
- 可作为[[Task Properties#Values for Dates in Tasks|任务属性]]`task.done`访问

### 取消日期

> [!released]
> 取消日期在Tasks 5.5.0中引入。

除非您在设置中禁用"为每个取消的任务设置取消日期"（并重启Obsidian），否则Tasks插件将帮助您跟踪任务的取消时间。

请参阅上面的[[#Date-tracking settings|截图]]。

取消日期使用红色叉号表情符号：❌。

```markdown
- [-] 倒垃圾 ❌ 2021-04-09
```

在Tasks查询块中使用的相关指令：

- [[Filters#Cancelled Date|取消日期过滤器]]
- [[Sorting#Cancelled Date|取消日期排序]]
- [[Grouping#Cancelled Date|取消日期分组]]
- 可作为[[Task Properties#Values for Dates in Tasks|任务属性]]`task.cancelled`访问

## 查找任务行中日期的错误

Tasks不会自动报告具有无效日期的问题任务，例如月份的第32天。这些任务将静默地不被基于日期的搜索找到。

但是，可以搜索库中具有无效日期的任何任务：请参阅
[[Filters#Finding Tasks with Invalid Dates|查找具有无效日期的任务]]。

> [!warning]
任务行上的日期值必须是日历或绝对日期，指向特定的年、月和日。诸如`📅 today`之类的文本不被Tasks插件理解，并且不会在搜索中找到。

## 任务日期支持的限制

### 日期格式不可配置

- 任务行上的日期格式尚不可配置。
- 唯一识别的格式是`YYYY-MM-DD`，例如`2024-09-17`。
- 无法自定义任务行上日期值的格式。
- 也无法将日期格式化为链接，例如`[[2024-09-17]]`。
- 我们在[discussion #69](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/69)中跟踪此问题。

### 日期不能包含时间

- 尚无法在任务行上包含时间以指示何时*应该*对其采取行动。
- 也无法记录任务创建、完成或取消的时间。
- 我们在discussions [#607](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/607)和[#668](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/668)中跟踪此问题。

### 时间跟踪、生产力跟踪、番茄钟、通知和类似功能超出范围

- 以下功能超出了Tasks插件的范围：时间跟踪、生产力跟踪、番茄钟、通知和类似功能。
- 我们在[discussion #2721](https://github.com/obsidian-tasks-group/obsidian-tasks/discussions/2721)中记录了这一点。
