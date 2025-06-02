---
publish: true
---

# Tasks API

<span class="related-pages">#plugin/quickadd</span>

## Tasks API接口

> [!released]
Tasks API接口在Tasks 2.0.0中引入。

Tasks公开了一个API，可用于将Tasks集成到其他插件、脚本或动态代码块中。

Tasks API可从`app.plugins.plugins['obsidian-tasks-plugin'].apiV1`获得，
其中`app`是Obsidian App。通常可以通过`this.app`获得对Obsidian App的引用，
但这取决于执行脚本的上下文。

这是API公开的接口：

<!-- snippet: TasksApiV1.ts -->
```ts
/**
 * Tasks API v1 接口
 */
export interface TasksApiV1 {
    /**
     * 打开Tasks UI并返回输入任务的Markdown字符串。
     *
     * @returns {Promise<string>} 一个包含输入任务的Markdown字符串的Promise，
     * 如果数据输入被取消，则返回空字符串。
     */
    createTaskLineModal(): Promise<string>;

    /**
     * 在提供的行字符串上执行'Tasks: Toggle task done'命令
     *
     * @param line 正在切换的任务行的markdown字符串
     * @param path 包含该行的文件路径
     * @returns 更新的行字符串，如果重复任务被完成，
     *          将包含两行。
     */
    executeToggleTaskDoneCommand: (line: string, path: string) => string;
}
```
<!-- endSnippet -->

## `createTaskLineModal(): Promise<string>;`

> [!released]
此方法在Tasks 2.0.0中引入。

此方法打开Tasks [[Create or edit Task|创建或编辑任务UI]]并返回输入任务的Markdown。
如果取消数据输入，则返回空字符串。

### 基本用法

```javascript
const tasksApi = this.app.plugins.plugins['obsidian-tasks-plugin'].apiV1;
let taskLine = await tasksApi.createTaskLineModal();

// 对返回的值做任何你想做的事情。
// 它只是一个包含任务Markdown的字符串。
console.log(taskLine);
```

> [!warning]
> 此函数返回一个`Promise` - 始终`await`结果！

> [!Tip]- 查找使用Tasks API创建任务的插件
> [搜索GitHub可能使用此函数的插件](https://github.com/search?q=createTaskLineModal+NOT+is%3Afork+NOT+repo%3Aobsidian-tasks-group%2Fobsidian-tasks+NOT+path%3A*.md&type=code)，通过使用`createTaskLineModal()`，将完全遵守您的Tasks设置。
> > [!warning]
> >
> > - 您需要登录GitHub才能使此搜索工作。
> > - 并非所有这些插件都已经过Obsidian团队审查：为了安全起见，您应该在`设置` > `社区插件`中搜索它们 - 或在[Plugins - Obsidian](https://obsidian.md/plugins)中查看。

### 与QuickAdd一起使用
最常见的使用场景之一可能是与[QuickAdd](https://github.com/chhoumann/quickadd)插件结合使用，
自动将任务添加到特定文件。

有关如何执行此操作的完整详细信息，请参阅[[Obsidian设置/Community plugins/Tasks/Other Plugins/QuickAdd#Launching the Edit task modal via QuickAdd|通过QuickAdd启动编辑任务模态框]]。

## `executeToggleTaskDoneCommand: (line: string, path: string) => string;`

> [!released]
> 此方法在Tasks 7.2.0中引入。

在提供的行字符串上执行'Tasks: Toggle task done'命令。它根据用户的偏好切换和更新任务行，考虑重复规则和完成状态。它返回一个表示切换任务的字符串。

```typescript
const tasksApi = this.app.plugins.plugins['obsidian-tasks-plugin'].apiV1;
const sourceFile: TFile = file;
const taskLine = '- [ ] This is a task 📅 2024-04-24';

const result = tasksApi.executeToggleTaskDoneCommand(taskLine, sourceFile.path);

// 对返回的值做任何你想做的事情。
// 它只是一个包含切换任务的Markdown的字符串。
console.log(result); // "- [x] This is a task 📅 2024-04-24 ✅ 2024-04-23"
```

> [!Tip]- 查找使用Tasks API切换任务的插件
> [搜索GitHub可能使用此函数的插件](https://github.com/search?q=executeToggleTaskDoneCommand+NOT+is%3Afork+NOT+repo%3Aobsidian-tasks-group%2Fobsidian-tasks+NOT+path%3A*.md&type=code)，通过使用`executeToggleTaskDoneCommand()`，将完全遵守您的Tasks设置。
> > [!warning]
> >
> > - 您需要登录GitHub才能使此搜索工作。
> > - 并非所有这些插件都已经过Obsidian团队审查：为了安全起见，您应该在`设置` > `社区插件`中搜索它们 - 或在[Plugins - Obsidian](https://obsidian.md/plugins)中查看。

## 自动建议集成

> [!released]
> 此集成在Tasks 7.2.0中引入。

[扩展Obsidian的markdown编辑器](https://gist.github.com/Fevol/caa478ce303e69eabede7b12b2323838)的插件可以通过在扩展编辑器类上实现`showTasksPluginAutoSuggest`方法来控制Tasks的[[Auto-Suggest|自动建议]]是否以及何时显示。此方法必须遵循以下函数定义。

```typescript
/**
 * 返回
 * - true明确请求显示建议
 * - false请求隐藏它
 * - undefined延迟到Tasks的默认行为
 *
 * @param cursor 编辑器中的当前光标位置
 * @param editor 编辑器实例
 * @param lineHasGlobalFilter 如果光标所在行匹配
 *        全局过滤器或没有设置全局过滤器则为True
 */
showTasksPluginAutoSuggest(
  cursor: EditorPosition,
  editor: Editor,
  lineHasGlobalFilter: boolean
): boolean | undefined
```

例如，这可以用于在非任务行上显示自动建议。[请参阅Kanban插件的示例](https://github.com/mgmeyers/obsidian-kanban/blob/5fa792b9c2157390fe493f0feed6f0bc9be72910/src/components/Editor/MarkdownEditor.tsx#L100-L106)。

> [!warning]
> 如果`Editor`不是`MarkdownView`，功能会稍有限制。
> 将无法创建[[Task Dependencies|任务依赖]]字段`id`和`dependsOn`。

> [!Tip]- 查找使用Tasks API建议任务属性的插件
> [搜索GitHub可能使用此函数的插件](https://github.com/search?q=showTasksPluginAutoSuggest+NOT+is%3Afork+NOT+repo%3Aobsidian-tasks-group%2Fobsidian-tasks+NOT+path%3A*.md&type=code)，通过使用`showTasksPluginAutoSuggest()`，将完全遵守您的Tasks设置。
> > [!warning]
> >
> > - 您需要登录GitHub才能使此搜索工作。
> > - 并非所有这些插件都已经过Obsidian团队审查：为了安全起见，您应该在`设置` > `社区插件`中搜索它们 - 或在[Plugins - Obsidian](https://obsidian.md/plugins)中查看。

## Tasks API的限制

- 编辑任务：
  - 还不能使用API通过Tasks [[Create or edit Task|创建或编辑任务UI]]编辑*现有任务行*。我们正在[issue #1945](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/1945)中跟踪此问题。
  - 还不能使用API通过Tasks [[Create or edit Task|创建或编辑任务UI]]添加[[Task Dependencies|依赖关系]]。我们正在[issue #2993](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2993)中跟踪此问题。
- 自动建议：
  - 当在[[Kanban plugin|Kanban插件]]卡片中使用自动建议时 - 或任何其他使用[[Tasks Api#Auto-Suggest Integration|自动建议集成]]的插件时，[[auto-suggest|自动建议]]还不能添加[[Task Dependencies|依赖关系]]。我们正在[issue #3274](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/3274)中跟踪此问题。
- 搜索任务：
  - 还不能通过API运行Tasks搜索。我们正在[issue #2459](https://github.com/obsidian-tasks-group/obsidian-tasks/issues/2459)中跟踪此问题。
