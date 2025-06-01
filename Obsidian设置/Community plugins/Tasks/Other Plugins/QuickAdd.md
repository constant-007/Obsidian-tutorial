---
publish: true
aliases:
  - Advanced/Quickadd
---

# QuickAdd

<span class="related-pages">#plugin/quickadd</span>

## 通过QuickAdd启动编辑任务模态框

本节展示了如何使用QuickAdd与[[Create or edit Task|创建或编辑任务]]模态框自动将任务添加到特定文件。

为此，您需要输入以下代码作为捕获格式：

````markdown
```js quickadd
return await this.app.plugins.plugins['obsidian-tasks-plugin'].apiV1.createTaskLineModal();
```
````

或者，如果您希望在新任务行后添加换行符，请使用此作为捕获格式：

````markdown
```js quickadd
return await this.app.plugins.plugins['obsidian-tasks-plugin'].apiV1.createTaskLineModal() + '\n';
```
````

详细信息请参阅[QuickAdd - 内联脚本](https://quickadd.obsidian.guide/docs/InlineScripts)。

### 创建QuickAdd捕获

使用这些步骤来显示以下选项（在QuickAdd 0.12.0中测试）：

![Screenshot - Create the QuickAdd Capture](../../images/quickadd-settings-create-capture.png)

1. 打开QuickAdd选项。
2. 在`Name`框中输入名称`Add task`。
3. 点击`Template`按钮并选择`Capture`。
4. 点击`Add Choice`。

### 配置QuickAdd捕获

![Screenshot - Open the QuickAdd Capture Configuration](../../images/quickadd-settings-configure-capture.png)

1. 在添加的新行中，点击齿轮（⚙）图标。
2. 现在填写下面的值。（请参阅上面要输入到`Capture format`框中的代码。）

QuickAdd捕获设置截图（示例）
![Screenshot - Edit the QuickAdd Capture Configuration](../../images/api-create-taskline-modal-quickadd-capture-example.png)

## 创建您自己的快捷方式来构建任务

[QuickAdd](https://github.com/chhoumann/quickadd)插件在创建任务时可以提供帮助。
除了创建任务的官方命令外，您还可以使用自定义捕获格式设置QuickAdd命令。

例如：

```markdown
#task {{VALUE:task name}} ⏰ {{VDATE:reminder date and time,YYYY-MM-DD HH:mm}} {{VALUE:⏫,🔼,🔽, }} 🔁 {{VALUE:recurrence}} 🛫 {{VDATE:start date,YYYY-MM-DD}} ⏳ {{VDATE:scheduled date,YYYY-MM-DD}} 📅 {{VDATE:due date,YYYY-MM-DD}}
```

您可以删除/保留某些字段来制作不同类型的任务。每种类型都可以有自己的命令。

### 一些示例

仅带到期日期的任务：

`#task {{VALUE:task name}} 📅 {{VDATE:due date,YYYY-MM-DD}}`

<video controls width="100%">
    <source src="https://user-images.githubusercontent.com/38974541/143467768-cf183171-296c-4229-81ca-a8f820b7a66e.mov" />
</video>

---

带有优先级和提醒日期和到期日期的任务：

`#task {{VALUE:task name}} ⏰ {{VDATE:reminder date and time,YYYY-MM-DD HH:mm}} {{VALUE:🔺,⏫,🔼,🔽,⏬️, }} 📅 {{VDATE:due date,YYYY-MM-DD}}`

<video controls width="100%">
    <source src="https://user-images.githubusercontent.com/38974541/143468599-ae598f7d-cc84-4fc9-8293-eae72cf81f8a.mov" />
</video>

---

带有重复和计划日期和开始日期的任务：

`#task {{VALUE:task name}} 🔁 {{VALUE:recurrence}} 🛫 {{VDATE:start date,YYYY-MM-DD}} ⏳ {{VDATE:scheduled date,YYYY-MM-DD}}`

<video controls width="100%">
    <source src="https://user-images.githubusercontent.com/38974541/143468440-c83b5f91-c923-4f30-9c52-7c69e64978c9.mov" />
</video>

## 如何添加QuickAdd命令

1. 安装[Natural Language Dates](https://github.com/argenos/nldates-obsidian)和[QuickAdd](https://github.com/chhoumann/quickadd)
2. 选择`capture`选择，然后通过点击闪电表情符号使其在命令面板中可见
3. 启用`save as task`选项，然后启用`capture format`选项并粘贴您的自定义格式
4. 通过标准的设置 -> 快捷键界面为您的新命令分配快捷键（您的新命令将显示为`QuickAdd: "您给捕获起的名称"`）

## 重复日期的提示（减少摩擦）

如果您注意到您多次添加相同的日期，例如到期日期和[[Advanced/Notifications|提醒日期]]相同。
那么您可以给它们相同的名称，这样您只需要写一次日期，QuickAdd将在多个地方插入它。

这是当前示例的格式：

```markdown
#task {{VALUE:task name}} ⏰ {{VDATE:same date,YYYY-MM-DD}} {{VDATE:time,HH:mm}} 📅 {{VDATE:same date,YYYY-MM-DD}}
```
