---
publish: true
---

# 查找可能包含无效数据的任务

## 动机

出于性能原因，Tasks在从markdown行读取数据时比某些用户期望的更严格。

作为预防措施，定期检查库中的数据可能很有用，看看是否有任何看似有效但Tasks未找到的数据的任务。

## 查找可能遗漏的表情符号标识符的任务

### 表情符号问题示例

在以下任务中，截止日期和完成日期后有无法识别的文本。

```text
 - [x] check 📅 2022-12-29 ✅ 2023-01-09 > appointment 19.1.
```

Tasks将其视为没有日期的任务，文本描述为：

`check 📅 2022-12-29 ✅ 2023-01-09 > appointment 19.1.`

### 查找未读表情符号

以下tasks代码块列出了描述中包含表情符号的任何任务，这通常意味着Tasks未解释的数据。这通常是因为行末除了表情符号标识符和标签之外还有一些其他文本。

<!-- include: ValidateTasks.test.validate-tasks_find-unread-emojis.approved.text -->
````text
```tasks
# 这些指令需要全部在一行上：
(description includes 🔺) OR (description includes ⏫) OR (description includes 🔼) OR (description includes 🔽) OR (description includes ⏬) OR (description includes 🛫) OR (description includes ➕) OR (description includes ⏳) OR (description includes 📅) OR (description includes ✅) OR (description includes ❌) OR (description includes 🔁) OR (description includes 🏁) OR (description includes ⛔) OR (description includes 🆔)

# 可选地，取消注释此行并排除您的模板位置
# path does not include _templates

group by path
```
````
<!-- endInclude -->

可以通过编辑任务并将出现在未解析值之后的任何文本移动到行中较早的位置来修复错误。

## 查找包含无效日期的任务

### 日期问题示例

此任务有一个非法的截止日期：

```text
- [ ] Do stuff 📅  2023-12-32
```

### 查找问题日期

以下tasks代码块列出了任何包含无效日期的任务，意味着Tasks可能未解释的数据。

<!-- include: ValidateTasks.test.validate-tasks_find_problem_dates.approved.text -->
````text
```tasks
# 这些指令需要全部在一行上：
(cancelled date is invalid) OR (created date is invalid) OR (done date is invalid) OR (due date is invalid) OR (scheduled date is invalid) OR (start date is invalid)

# 可选地，取消注释此行并排除您的模板位置
# path does not include _templates

group by path
```
````
<!-- endInclude -->

包含无效日期的错误不容易使用[[Create or edit Task|"创建或编辑任务"模态框]]修复，因为它显示任何无效日期时使用占位符文本，而不是显示原始值。

因此，要修复任何找到的任务，请使用[[Backlinks|反向链接]]导航到原始行并在那里修复错误。

## 无效重复规则

以下查找可能具有无效重复规则的任务，因为尽管有🔁表情符号，它们被视为不重复。

````text
```tasks
is not recurring
filter by function task.originalMarkdown.includes('🔁')
```
````

## 更多信息

相关文档部分：

- [[Getting Started#Limitations and warnings|解析任务的限制和警告]]
- [[Filters#Finding Tasks with Invalid Dates|查找包含无效日期的任务]]。
